import zope.interface

from seminar2.IGameItem import IGameItem


@zope.interface.implementer(IGameItem)
class GoldReward:
    def open(self):
        print("Открыли сундук с золотом")
