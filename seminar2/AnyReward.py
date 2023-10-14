import zope.interface
from seminar2.IGameItem import IGameItem


@zope.interface.implementer(IGameItem)
class AnyReward:
    def open(self):
        print("Открыли сундук с чем-то ещё")
