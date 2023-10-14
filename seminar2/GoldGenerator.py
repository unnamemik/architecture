from seminar2.ItemFabric import ItemFabric
from seminar2.GoldReward import GoldReward


class GoldGenerator(ItemFabric):

    def create_item(self):
        print("Создали сундук (золото)")
        return GoldReward()