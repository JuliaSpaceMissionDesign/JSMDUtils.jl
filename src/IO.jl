module IO 

using JSON3: JSON3
using JSMDInterfaces.IO

import YAML as YAMLlib

for fn in (:JSON, :TXT, :YAML)
    @eval begin
        IO.@filetype $fn IO.AbstractFile
        export $fn
    end
end

"""
    load(file::JSON{1})

Open a JSON file and parse its data in a dictionary.
"""
function load(file::JSON{1})
    open(filepath(file), "r") do f
        data = JSON3.read(f)
        return Dict(data)
    end
end

"""
    load(file::TXT{1})

Open a TEXT file and parse its data in a list of strings.
"""
function load(file::TXT{1})
    return readlines(filepath(file))
end

"""
    load(file::YAML{1})

Open a YAML file and parse its data in a dictionary.
"""
function load(file::YAML{1})
    return YAMLLib.load_file(filepath(file); dicttype=Dict{Symbol,Any})
end


end