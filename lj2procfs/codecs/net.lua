local ffi = require("ffi")
local libc = require("lj2procfs.libc")

local function net(path)
	path = path or "/proc/net"

	local buff = ffi.new("char [2048]")
	local buffsize = 2048

	local size = libc.readlink(path, buff, buffsize);

	if size > 0 then
		return ffi.string(buff, size)
	end

	return nil;
end

return {
	decoder = net;
}