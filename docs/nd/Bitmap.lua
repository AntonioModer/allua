-- Class: bitmap

-- Function: clone
-- Parameters:
-- bitmap - bitmap to clone
--
-- Returns:
-- clone of bitmap
function clone (bitmap) end

-- Function: create
-- Parameters:
-- w - Width of bitmap
-- h - Height of bitmap
--
-- Returns:
-- Bitmap instance
function create (w, h) end

-- Function: create_sub
-- Parameters:
-- parent - Parent bitmap
-- x - Left edge
-- y - Top edge
-- w - Width of bitmap
-- h - Height of bitmap
--
-- Returns:
-- Bitmap instance
function create_sub (parent, x, y, w, h) end

-- Function: get_new_flags
-- Returns:
-- flags
function get_new_flags () end

-- Function: set_new_flags
-- Parameters:
-- flags - flags
function set_new_flags (flags) end

-- Function: get_new_format
-- Returns:
-- format
function get_new_format () end

-- Function: load
-- Parameters:
-- filename - path to file
--
-- Returns:
-- Bitmap instance
function load (filename) end

-- Function: get_width
-- Parameters:
-- bitmap - bitmap
--
-- Returns:
-- Width of bitmap
function get_width (bitmap) end

-- Function: get_height
-- Parameters:
-- bitmap - bitmap
--
-- Returns:
-- Height of bitmap
function get_height (bitmap) end

-- Function: draw
-- Parameters:
-- bitmap - bitmap
-- x - Left position
-- y - Top position
-- flags - Bitmap flags
function draw (bitmap, x, y, flags) end

-- Function: draw_region
-- Parameters:
-- bitmap - bitmap
-- sx - Source Left
-- sy - Source Top
-- sw - Source width
-- sh - Source height
-- dx - Left position
-- dy - Top position
-- flags - Bitmap flags
function draw_region (bitmap, sx, sy, sw, sh, dx, dy, flags) end

-- Function: draw_rotated
-- Parameters:
-- bitmap - bitmap
-- cx - Source Center x
-- cy - Source Center y
-- dx - Left position
-- dy - Top position
-- angle - Rotation
-- flags - Bitmap flags
function draw_rotated (bitmap, cx, cy, dx, dy, angle, flags) end

-- Function: draw_rotated_scaled
-- Parameters:
-- bitmap - bitmap
-- cx - Source Center x
-- cy - Source Center y
-- dx - Left position
-- dy - Top position
-- scalex - Scale x-wise
-- scaley - Scale y-wise
-- angle - Rotation
-- flags - Bitmap flags
function draw_rotated_scaled (bitmap, cx, cy, dx, dy, scalex, scaley, angle, flags) end

-- Function: draw_scaled
-- Parameters:
-- bitmap - bitmap
-- sx - Source Left
-- sy - Source Top
-- sw - Source width
-- sh - Source height
-- dx - Destination Left
-- dy - Destination Top
-- dw - Destination width
-- dh - Destination height
-- flags - Bitmap flags
function draw_scaled (bitmap, sx, sy, sw, sh, dx, dy, dw, dh, flags) end
