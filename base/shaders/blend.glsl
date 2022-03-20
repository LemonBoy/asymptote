layout(binding=0, std430) buffer offsetBuffer {
  uint offset[];
};

layout(binding=1, std430) buffer maxBuffer {
  uint maxSize;
};

#ifdef GPUINDEXING
uniform uint pixels;
uniform uint offset2;
uniform uint m1;
uniform uint r;

layout(binding=2, std430) buffer localSumBuffer {
  uint localSum[];
};

layout(binding=3, std430) buffer globalSumBuffer {
  uint globalSum[];
};
#else
layout(binding=2, std430) buffer countBuffer {
  uint count[];
};
#endif

layout(binding=4, std430) buffer fragmentBuffer {
  vec4 fragment[];
};

layout(binding=5, std430) buffer depthBuffer {
  float depth[];
};

layout(binding=6, std430) buffer opaqueBuffer {
  vec4 opaqueColor[];
};

layout(binding=7, std430) buffer opaqueDepthBuffer {
  float opaqueDepth[];
};

out vec4 outColor;

uniform uint width;
uniform vec4 background;

vec4 blend(vec4 outColor, vec4 color)
{
  return mix(outColor,color,color.a);
}

void main()
{
  uint headIndex=uint(gl_FragCoord.y)*width+uint(gl_FragCoord.x);
#ifdef GPUINDEXING
  uint size=offset[headIndex];
#else
  uint size=count[headIndex];
#endif
  float OpaqueDepth=opaqueDepth[headIndex];
  if(size == 0u) {
#ifdef GPUINDEXING
    offset[pixels+headIndex]=0u;
#endif
    if(OpaqueDepth != 0.0)
      opaqueDepth[headIndex]=0.0;
    discard;
  }

  outColor=OpaqueDepth != 0.0 ? opaqueColor[headIndex] : background;

#ifdef GPUINDEXING
  uint p=headIndex < r*(m1+1u) ? headIndex/(m1+1u) : (headIndex-r)/m1;
  uint listIndex=localSum[p]+localSum[offset2+p/m2]+globalSum[p/(m2*m2)]+
    offset[pixels+headIndex];
#else
  uint listIndex=offset[headIndex]-size;
#endif

  uint k=0u;
  if(OpaqueDepth != 0.0)
    while(k < size && depth[listIndex+k] >= OpaqueDepth)
      ++k;

  uint n=size-k;

  // Sort the fragments with respect to descending depth
  if(n <= ARRAYSIZE) {
    if(n == 1)
      outColor=blend(outColor,fragment[listIndex+k]);
    else if(n > 0) {
      struct element {
        uint index;
        float depth;
      };

      element E[ARRAYSIZE];
      E[0]=element(k,depth[listIndex+k]);
      uint i=1u;
      while(++k < size) {
        float d=depth[listIndex+k];
        if(OpaqueDepth != 0.0) {
          while(k < size && d >= OpaqueDepth) {
            ++k;
            d=depth[listIndex+k];
          }
          if(k == size) break;
        }
        uint j=i;
        while(j > 0u && d > E[j-1u].depth) {
          E[j]=E[j-1u];
          --j;
        }
        E[j]=element(k,d);
        ++i;
      }
      for(uint j=0u; j < i; ++j)
        outColor=blend(outColor,fragment[listIndex+E[j].index]);
    }

    if(OpaqueDepth != 0.0)
      opaqueDepth[headIndex]=0.0;
  } else {
    atomicMax(maxSize,size);
    for(uint i=k+1u; i < size; i++) {
      vec4 temp=fragment[listIndex+i];
      float d=depth[listIndex+i];
      uint j=i;
      while(j > 0u && d > depth[listIndex+j-1u]) {
        fragment[listIndex+j]=fragment[listIndex+j-1u];
        depth[listIndex+j]=depth[listIndex+j-1u];
        --j;
      }
      fragment[listIndex+j]=temp;
      depth[listIndex+j]=d;
    }

    uint stop=listIndex+size;
    if(OpaqueDepth == 0.0)
      for(uint i=listIndex+k; i < stop; i++)
        outColor=blend(outColor,fragment[i]);
    else {
      for(uint i=listIndex+k; i < stop; i++) {
        if(depth[i] < OpaqueDepth)
          outColor=blend(outColor,fragment[i]);
      }
      opaqueDepth[headIndex]=0.0;
    }
  }

#ifdef GPUINDEXING
  offset[headIndex]=0u;
  offset[pixels+headIndex]=0u;
#else
  count[headIndex]=0u;
#endif
}
