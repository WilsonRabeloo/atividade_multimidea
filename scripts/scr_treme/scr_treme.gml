function screenshake(_treme = 1){
    
    if instance_exists(obj_treme){
        
        with(obj_treme){
            
            if (_treme>global.shake){
                
                global.shake=_treme
            }
        }
    }
}