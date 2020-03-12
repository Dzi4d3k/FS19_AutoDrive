RestartADTask = ADInheritsFrom(AbstractTask)

function RestartADTask:new(vehicle)
    local o = RestartADTask:create()
    o.vehicle = vehicle
    return o
end

function RestartADTask:setUp()
    print("RestartADTask:setUp()")
    self:doRestart()
end

function RestartADTask:update(dt)
    self:finished()
end

function RestartADTask:abort()
end

function RestartADTask:finished()
    self.vehicle.ad.taskModule:setCurrentTaskFinished(ADTaskModule.DONT_PROPAGATE)
end

function RestartADTask:doRestart()
    if self.vehicle.ad.stateModule:isActive() then
        AutoDrive.disableAutoDriveFunctions(self.vehicle)
    end
    vehicle.ad.stateModule:getCurrentMode():start()
end