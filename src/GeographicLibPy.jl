__precompile__()


module GeographicLibPy

import PyCall


const geographiclib = PyCall.PyNULL()
const geographiclib_geodesic = PyCall.PyNULL()
# const Geodesic = PyCall.PyNULL()
const WGS84 = PyCall.PyNULL()


function __init__()
    try
        copy!(geographiclib, PyCall.pyimport("geographiclib"))
    catch e
        if PyCall.conda
            info("Installing geographiclib by conda")
            Conda.add("geographiclib")
            copy!(geographiclib, PyCall.pyimport("geographiclib"))
        else
            error("Failed to import geographiclib Python package: ", e)
        end
    end

    copy!(geographiclib_geodesic, PyCall.pyimport("geographiclib.geodesic"))
    copy!(WGS84, geographiclib_geodesic[:Geodesic][:WGS84])
end


function inverse(lat1, lon1, lat2, lon2, model=WGS84)
    model[:Inverse](lat1, lon1, lat2, lon2)
end

end
