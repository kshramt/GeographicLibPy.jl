__precompile__()


module GeographicLib

import PyCall


function __init__()
    global const geodesic = PyCall.pyimport("geographiclib.geodesic")
    global const Geodesic = geodesic[:Geodesic]
    global const WGS84 = Geodesic[:WGS84]
end


function inverse(lat1, lon1, lat2, lon2, model=WGS84)
    model[:Inverse](lat1, lon1, lat2, lon2)
end

end
