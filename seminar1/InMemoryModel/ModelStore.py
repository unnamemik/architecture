#!/usr/bin/python
#-*- coding: utf-8 -*-

class ModelStore:
    def __init__(self):
        self.Models = None
        self.Scenes = None
        self.Flashes = None
        self.Cameras = None
        self.changeObservers = None

    def GetScena(self, int):
        pass

    def NotifyChange(self, ModelChanger):
        pass

