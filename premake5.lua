local current_dir = _SCRIPT_DIR

function IncludeBootil()
	local refcount
	if IncludePackage then
		refcount = IncludePackage "bootil"
	end

	local _project = project()
	
	local incld = externalincludedirs or sysincludedirs
	incld(current_dir .. "/bootil/include")
	
	links { "bootil_static" }

	if refcount == 1 then
		dofile(current_dir .. "/bootil/projects/bootil_premake5.lua")
		project(_project.name)
	end
end