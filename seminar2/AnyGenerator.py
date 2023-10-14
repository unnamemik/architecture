from seminar2.ItemFabric import ItemFabric
from seminar2.AnyReward import AnyReward


class AnyGenerator(ItemFabric):

    def create_item(self):
        print("Создали сундук (что-то ещё)")
        return AnyReward()
