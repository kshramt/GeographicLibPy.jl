module GeographicLibPy

using PyCall


const geographiclib = PyCall.PyNULL()
const geographiclib_geodesic = PyCall.PyNULL()
# const Geodesic = PyCall.PyNULL()
const WGS84 = PyCall.PyNULL()


function __init__()
    copy!(
        geographiclib,
        try
            PyCall.pyimport("geographiclib")
        catch
            PyCall.Conda.runconda(`install -y -c defaults -c conda-forge  geographiclib`)
            PyCall.pyimport("geographiclib")
        end,
    )
    copy!(geographiclib_geodesic, PyCall.pyimport("geographiclib.geodesic"))
    copy!(WGS84, geographiclib_geodesic[:Geodesic][:WGS84])
end


function direct(lat1, lon1, azi1, s12, model=WGS84)
    model[:Direct](lat1, lon1, azi1, s12)
end


function inverse(lat1, lon1, lat2, lon2, model=WGS84)
    model[:Inverse](lat1, lon1, lat2, lon2)
end

end
