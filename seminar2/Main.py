import random
from seminar2.AnyGenerator import AnyGenerator
from seminar2.GemGenerator import GemGenerator
from seminar2.GoldGenerator import GoldGenerator

if __name__ == '__main__':
    fabricList = [GoldGenerator(), GemGenerator(), AnyGenerator()]
    for i in range(20):
        rnd = random.choice(fabricList).create_item().open()
