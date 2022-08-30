var layerID = layer_get_id(tilemap_name);
tilemap = layer_tilemap_get_id(layerID);

//starting_x = tilemap_get_x(tiles) + tilemap_x_offset;
//starting_y = tilemap_get_y(tiles) + tilemap_y_offset;
//tile_height = tilemap_get_tile_height(tiles);
//tile_width = tilemap_get_tile_width(tiles);
//tile_height_multi = tile_height / 64;
//tile_width_multi = tile_width / 64;
//increment = tilemap_get_tile_width(tiles);
//width = tilemap_get_width(tiles);
//height = tilemap_get_height(tiles);



//for (i = 0; i < width; i ++)
//{
//	for (j = 0; j < height; j++)
//	{
//		if tilemap_get_at_pixel(tiles, starting_x + i*tile_width, starting_y + j*tile_height)
//		{
//			var inst = instance_create_depth(starting_x + i*tile_width, starting_y + j*tile_height, 0, obj_tile_collision);
//			inst.image_xscale = 1 * tile_width_multi;
//			inst.image_yscale = 1 * tile_height_multi;
//		}
//	}
//}

// Get the number of rows and columns of tiles
var columns = tilemap_get_width(tilemap);
var rows = tilemap_get_height(tilemap);

show_debug_message(string(tilemap_get(tilemap,0,0)));

// Find each tile
for (var xx = 0; xx < columns; xx++) {
	for (var yy = 0; yy < rows; yy++) {	
		// show_debug_message("Checking tile (" + string(xx) + ", " + string(yy) + ")");
		
		if tilemap_get(tilemap, xx, yy) == 0 continue;
		
		// Up
		var u = yy - 1 > -1 and tilemap_get(tilemap, xx, yy-1) != 0;
		// Up up
		var uu = yy - 2 > -1 and tilemap_get(tilemap, xx, yy-2) != 0;
		// Down 
		var d = yy + 1 < rows and tilemap_get(tilemap, xx, yy+1) != 0;
		// Left
		var l = xx - 1 > -1 and tilemap_get(tilemap, xx-1, yy) != 0;
		// Right
		var r = xx + 1 < columns and tilemap_get(tilemap, xx+1, yy) != 0;
		
		// Evaluate
		// Solo
		if not u and not d and not l and not r {
			tilemap_set(tilemap, tiledata_solo, xx, yy);
			 continue;
		}
	
		// Droop
		if u and not d and not l and not r {
			if uu {
				tilemap_set(tilemap, tiledata_droop, xx, yy);
				 continue;
			} else {
				tilemap_set(tilemap, tiledata_droop_sub, xx, yy);
			}
		}
		// Cap left
		if not u and not d and not l and r {
			tilemap_set(tilemap, tiledata_cap_left, xx,yy);
			 continue;
		}
		// Cap right
		if not u and not d and l and not r {
			tilemap_set(tilemap, tiledata_cap_right, xx,yy);
			 continue;
		}
		// Cap top
		if not u and d and not l and not r {
			tilemap_set(tilemap, tiledata_cap_top, xx,yy);
			 continue;
		}
	
		// Corner topleft
		if not u and d and not l and r {
			tilemap_set(tilemap, tiledata_corner_topleft, xx,yy);
			 continue;
		}
		// Corner topright
		if not u and d and l and not r {
			tilemap_set(tilemap, tiledata_corner_topright, xx,yy);
			 continue;
		}
		// Corner botleft
		if u and not d and not l and r {
			if uu {
				tilemap_set(tilemap, tiledata_corner_botleft, xx,yy);
				 continue;
			} else {
				tilemap_set(tilemap, tiledata_corner_botleft_sub, xx,yy);
				 continue;
			}
		}
		// Corner botright
		if u and not d and l and not r {
			if uu {
				tilemap_set(tilemap, tiledata_corner_botright, xx,yy);
				 continue;
			} else {
				tilemap_set(tilemap, tiledata_corner_botright_sub, xx,yy);
				 continue;
			}
		}
	
		// Edge top
		if not u and d and l and r {
			tilemap_set(tilemap, tiledata_edge_top, xx,yy);
			 continue;
		}
		// Edge bot
		if u and not d and l and r {
			if uu {
				tilemap_set(tilemap, tiledata_edge_bot, xx,yy);
				 continue;
			} else {
				tilemap_set(tilemap, tiledata_edge_bot_sub, xx,yy);
				 continue;
			}
		}
		// Edge left
		if u and d and not l and r {
			if uu {
				tilemap_set(tilemap, tiledata_edge_left,xx,yy);
				 continue;
			} else {
				tilemap_set(tilemap, tiledata_edge_left_sub, xx,yy);
				 continue;
			}
		}
		// Edge right
		if u and d and l and not r {
			if uu {
				tilemap_set(tilemap, tiledata_edge_right ,xx,yy);
				 continue;
			} else {
				tilemap_set(tilemap, tiledata_edge_right_sub, xx,yy);
				 continue;
			}
		}
	
		// Sliver hori
		if not u and not d and l and r {
			tilemap_set(tilemap, tiledata_sliver_hori, xx,yy);
			 continue;
		}
		// Sliver vert
		if u and d and not l and not r {
			if uu {
				tilemap_set(tilemap, tiledata_sliver_vert, xx,yy);
				 continue;
			} else {
				tilemap_set(tilemap, tiledata_sliver_vert_sub, xx,yy);
				 continue;
			}
		}
	
		// Enclosed
		if u and d and l and r {
			if uu {
				tilemap_set(tilemap, tiledata_enclosed, xx,yy);
				 continue;
			}else {
				tilemap_set(tilemap, tiledata_enclosed_sub,xx,yy);
			}
		}
	}
}