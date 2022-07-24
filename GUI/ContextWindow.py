import PyQt5.QtWidgets as Qw
import PyQt5.QtGui as Qg
import PyQt5.QtCore as Qc
import xasyVersion

import xasyUtils as xu
import xasy2asy as x2a
import xasyFile as xf
import xasyOptions as xo
import UndoRedoStack as Urs
import xasyArgs as xa
import xasyBezierInterface as xbi
from xasyTransform import xasyTransform as xT
import xasyStrings as xs

import PrimitiveShape
import InplaceAddObj

import CustMatTransform
import SetCustomAnchor
import GuidesManager
import time

class AnotherWindow(Qw.QWidget):
    def __init__(self, shape, parent):
        super().__init__()
        self.shape = shape
        self.parent = parent
        self.newShape = self.shape
        self.layout = Qw.QVBoxLayout(self)
        
        # Initialize tab screen
        self.tabs = Qw.QTabWidget()
        self.fillTab = Qw.QWidget()
        self.lineTab = Qw.QWidget()
        self.arrowTab = Qw.QWidget()
        self.othersTab = Qw.QWidget()
        self.tabs.resize(300,200)
        self.fillTab.layout = Qw.QVBoxLayout(self)
        self.lineTab.layout = Qw.QVBoxLayout(self)
        self.arrowTab.layout = Qw.QVBoxLayout(self)
        self.othersTab.layout = Qw.QVBoxLayout(self)
        self.tabs.addTab(self.fillTab,"Fill Options")
        self.tabs.addTab(self.lineTab,"Line Options")
        self.tabs.addTab(self.arrowTab,"Arrow Options")
        self.tabs.addTab(self.othersTab,"Misc. Options")

        self.layout.addWidget(self.tabs)
        self.setLayout(self.layout)
        self.setWindowTitle("Shape Options Window")

        self.label = Qw.QLabel("Fill:")
        self.fillTab.layout.addWidget(self.label)
        self.fillButton = Qw.QComboBox()
        self.fillButton.addItem("Unfilled")
        self.fillButton.addItem("Filled")
        self.fillButton.currentIndexChanged.connect(self.fillChange)
        self.fillTab.layout.addWidget(self.fillButton)

        self.colorButton = Qw.QPushButton("Set Line Colour")
        self.colorButton.clicked.connect(self.pickColor)
        self.fillTab.layout.addWidget(self.colorButton)

        self.colorButton = Qw.QPushButton("Set Fill Colour")
        self.colorButton.clicked.connect(self.pickFillColor)
        self.fillTab.layout.addWidget(self.colorButton)

        self.label = Qw.QLabel("Reflection:")
        self.othersTab.layout.addWidget(self.label)
        self.reflectionButton = Qw.QComboBox()
        self.reflectionButton.addItem("None")
        self.reflectionButton.addItem("Horizontal")
        self.reflectionButton.addItem("Vertical")
        self.reflectionButton.currentIndexChanged.connect(self.reflectionChange)
        self.othersTab.layout.addWidget(self.reflectionButton)

        self.label = Qw.QLabel("Arrowhead:")
        self.arrowTab.layout.addWidget(self.label)
        self.arrowheadButton = Qw.QComboBox()
        self.arrowList = ["None","Arrow","ArcArrow"]
        for arrowMode in self.arrowList:
            self.arrowheadButton.addItem(arrowMode)
        self.arrowheadButton.currentIndexChanged.connect(self.arrowheadChange)
        self.arrowTab.layout.addWidget(self.arrowheadButton)

        self.label = Qw.QLabel("Line Style:")
        self.lineTab.layout.addWidget(self.label)
        self.linestyleButton = Qw.QComboBox()
        self.lineListStrings = ["SolidLine","DashLine","DotLine","DashDotLine"] #Is there a way to pull these directly
        self.lineList = [Qc.Qt.PenStyle.SolidLine,Qc.Qt.PenStyle.DashLine,Qc.Qt.PenStyle.DotLine,Qc.Qt.PenStyle.DashDotLine]

        for lineMode in self.lineListStrings:
            self.linestyleButton.addItem(lineMode)
        self.linestyleButton.currentIndexChanged.connect(self.linestyleChange)
        self.lineTab.layout.addWidget(self.linestyleButton)

        #TODO: Make this a function. 
        if not isinstance(self.shape, x2a.xasyShape):
            self.fillButton.setCurrentIndex(int(self.shape.arrowSettings["fill"]))
            if isinstance(self.shape, x2a.asyArrow):
                self.arrowheadButton.setCurrentIndex(int(self.shape.arrowSettings["active"]))
            else:
                self.arrowheadButton.setDisabled(True)
        else:
            self.fillButton.setCurrentIndex(int(self.shape.path.fill))

        if isinstance(self.shape, x2a.asyArrow) and self.shape.arrowSettings["active"]: #Make these all a list or something.
            self.label = Qw.QLabel("Arrow Style:")
            self.arrowTab.layout.addWidget(self.label)
            self.arrowstyleButton = Qw.QComboBox()
            for arrowStyle in self.shape.arrowStyleList:
                self.arrowstyleButton.addItem(arrowStyle if arrowStyle else "(default)")
            self.arrowstyleButton.currentIndexChanged.connect(self.arrowstyleChange)
            self.arrowTab.layout.addWidget(self.arrowstyleButton)

            self.label = Qw.QLabel("Arrow Size:")
            self.arrowTab.layout.addWidget(self.label)
            self.arrowSizeBox = Qw.QLineEdit()
            self.arrowTab.layout.addWidget(self.arrowSizeBox)
            self.arrowSizeBox.setPlaceholderText(self.getInfo("DefaultHead.size(currentpen)"))

            self.label = Qw.QLabel("Arrow Angle:")
            self.arrowTab.layout.addWidget(self.label)
            self.arrowAngleBox = Qw.QLineEdit()
            self.arrowTab.layout.addWidget(self.arrowAngleBox)
            self.arrowAngleBox.setPlaceholderText(self.getInfo("arrowangle"))

            self.label = Qw.QLabel("Arrow Fill:")
            self.arrowTab.layout.addWidget(self.label)
            self.arrowFillButton = Qw.QComboBox()
            for arrowFillStyle in self.shape.arrowFillList:
                self.arrowFillButton.addItem(arrowFillStyle if arrowFillStyle else "(default)")
            self.arrowFillButton.currentIndexChanged.connect(self.arrowFillChange)
            self.arrowTab.layout.addWidget(self.arrowFillButton)

            self.arrowstyleButton.setCurrentIndex(int(self.shape.arrowSettings["style"]))
            self.arrowFillButton.setCurrentIndex(int(self.shape.arrowSettings["fill"]))

        self.fillTab.setLayout(self.fillTab.layout)
        self.lineTab.setLayout(self.lineTab.layout)
        self.arrowTab.setLayout(self.arrowTab.layout)
        self.othersTab.setLayout(self.othersTab.layout)

        self.confirmButton = Qw.QPushButton("Render")
        self.confirmButton.clicked.connect(self.renderChanges)
        self.layout.addWidget(self.confirmButton)

    def arrowheadChange(self, i):
        #None, {Arrow, ArcArrow} x {(),(SimpleHead),(HookHead),(TeXHead)}
        if isinstance(self.shape, x2a.xasyShape):
            if i != 0:
                self.newShape = self.newShape.arrowify(arrowhead=i)
        else:
            self.newShape.arrowSettings["active"] = i #Simplify the logic

    def arrowstyleChange(self, i):
        self.newShape.arrowSettings["style"] = i

    def linestyleChange(self, i): #I think add an attribute to asyPen
        self.shape.pen.setStyle(self.lineList[i])

        #newPen = self.newShape.pen.toQPen()
        #newPen.setStyle(self.lineList[i])
        #newPen._deferAsyfy = False #???

        #newPen.color = newPen.color()
        #self.newShape.pen = x2a.asyPen.toQPen()

        #finalPen = x2a.asyPen()
        #finalPen.color = newPen.color()
        #self.newShape.pen = finalPen.toQPen(newPen)

    def fillChange(self, i):
        if isinstance(self.shape, x2a.asyArrow):
            self.shape.arrowSettings["fill"] = bool(i)
        elif self.shape.path.fill != bool(i):
            self.newShape = self.newShape.swapFill()

    def reflectionChange(self, i): #TODO: Modernize this.
        reflectionList = [[1,1],[1,-1],[-1,1]]
        self.parent.newTransform = xT.makeScaleTransform(*reflectionList[i], self.parent.currentAnchor).toQTransform()
        self.parent.currentlySelectedObj['selectedIndex'] = self.parent.mostRecentObject
        self.parent.releaseTransform()
        self.parent.newTransform = Qg.QTransform()

    def sizeChange(self):
        newSize = self.arrowSizeBox.text()
        try:
            self.newShape.arrowSettings["size"] = float(newSize)
        except:
            return #TODO: Show error message.

    def angleChange(self): #Refactor this with the above. 
        newAngle = self.arrowAngleBox.text()
        try:
            self.newShape.arrowSettings["angle"] = float(newAngle)
        except:
            return #TODO: Show error message.
            
    def arrowFillChange(self, i): #Can I lambda this? 
        self.newShape.arrowSettings["fill"] = i
        
    def renderChanges(self): #Pull from text boxes here.
        if isinstance(self.shape, x2a.asyArrow) and self.shape.arrowSettings["active"]:
            self.sizeChange()
            self.angleChange()
        if self.newShape:
            self.parent.replaceObject(self.parent.contextWindowObject,self.newShape)
        self.parent.terminateContextWindow()        

    def getInfo(self,value):
        """ Find out the size of an arbitrary Asymptote pen """
        self.asyEngine = self.parent.asyEngine
        assert isinstance(self.asyEngine, x2a.AsymptoteEngine)
        assert self.asyEngine.active

        fout = self.asyEngine.ostream
        fin = self.asyEngine.istream

        fout.write("write(_outpipe,{},endl);\n".format(value))
        fout.write(self.asyEngine.xasy)
        fout.flush()

        return fin.readline()

    def pickColor(self):
        self.colorDialog = Qw.QColorDialog(x2a.asyPen.convertToQColor(self.shape.pen.color), self)
        self.colorDialog.show()
        result = self.colorDialog.exec()
        if result == Qw.QDialog.Accepted:
            self.shape.pen.setColor(self.colorDialog.selectedColor())
            self.parent.updateFrameDispColor()

    def pickFillColor(self): #This is a copy of the above, how do you set the var as it is set?
        self.colorDialog = Qw.QColorDialog(x2a.asyPen.convertToQColor(self.shape.fillPen.color), self)
        self.colorDialog.show()
        result = self.colorDialog.exec()
        if result == Qw.QDialog.Accepted:
            self.shape.fillPen.setColor(self.colorDialog.selectedColor())
            self.parent.updateFrameDispColor()

    @Qc.pyqtSlot()
    def on_click(self):
        print("\n")
        for currentQTableWidgetItem in self.tableWidget.selectedItems():
            print(currentQTableWidgetItem.row(), currentQTableWidgetItem.column(), currentQTableWidgetItem.text())
