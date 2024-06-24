function controller = updateFlowTable(controller, switchID, src, dst, action)
    controller.flowTable{switchID} = [controller.flowTable{switchID}; {src, dst, action}];
end
