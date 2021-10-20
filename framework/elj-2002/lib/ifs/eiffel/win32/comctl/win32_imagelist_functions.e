class WIN32_IMAGELIST_FUNCTIONS


feature {NONE}

	-- ImageList_Add

	ImageList_Add (a_himl : POINTER;
					a_hbmImage : POINTER;
					a_hbmMask : POINTER) : INTEGER is
			-- The ImageList_Add function adds an image or images
			-- to an image list.
		external "C use <windows.h>"
		end -- ImageList_Add

	-- ImageList_AddMasked

	ImageList_AddMasked (a_himl : POINTER;
							a_hbmImage : POINTER;
							a_crMask : INTEGER) : INTEGER is
			-- The ImageList_AddMasked function adds an image or
			-- images to an image list, generating a mask from the
			-- specified bitmap.
		external "C use <windows.h>"
		end -- ImageList_AddMasked

	-- ImageList_BeginDrag

	ImageList_BeginDrag (a_himlTrack : POINTER;
							a_iTrack : INTEGER;
							a_dxHotspot : INTEGER;
							a_dyHotspot : INTEGER) : BOOLEAN is
			-- The ImageList_BeginDrag function begins dragging an
			-- image.
		external "C use <windows.h>"
		end -- ImageList_BeginDrag

	-- ImageList_Create

	ImageList_Create (a_cx : INTEGER;
						a_cy : INTEGER;
						a_flags : INTEGER;
						a_cInitial : INTEGER;
						a_cGrow : INTEGER) : POINTER is
			-- The ImageList_Create function creates a new image
			-- list.
		external "C use <windows.h>"
		end -- ImageList_Create

	-- ImageList_Destroy

	ImageList_Destroy (a_himl : POINTER) : BOOLEAN is
			-- The ImageList_Destroy function destroys an image list.
		external "C use <windows.h>"
		end -- ImageList_Destroy

	-- ImageList_DragEnter

	ImageList_DragEnter (a_hwndLock : POINTER;
							a_x : INTEGER;
							a_y : INTEGER) : BOOLEAN is
			-- The ImageList_DragEnter function locks updates to
			-- the specified window during a drag operation and displays
			-- the drag image at the specified position within the
			-- window.
		external "C use <windows.h>"
		end -- ImageList_DragEnter

	-- ImageList_DragLeave

	ImageList_DragLeave (a_hwndLock : POINTER) : BOOLEAN is
			-- The ImageList_DragLeave function unlocks the specified
			-- window and hides the drag image, allowing the window
			-- to be updated.
		external "C use <windows.h>"
		end -- ImageList_DragLeave

	-- ImageList_DragMove

	ImageList_DragMove (a_x : INTEGER;
				a_y : INTEGER) : BOOLEAN is
			-- The ImageList_DragMove function moves the image that
			-- is being dragged during a drag-and-drop operation.
			-- This function is typically called in response to a
			-- WM_MOUSEMOVE message.
		external "C use <windows.h>"
		end -- ImageList_DragMove

	-- ImageList_DragShowNolock

	ImageList_DragShowNolock (a_fShow : BOOLEAN) : BOOLEAN is
			-- The ImageList_DragShowNolock function shows or hides
			-- the image being dragged.
		external "C use <windows.h>"
		end -- ImageList_DragShowNolock

	-- ImageList_Draw

	ImageList_Draw (a_himl : POINTER;
					a_i : INTEGER;
					a_hdcDst : POINTER;
					a_x : INTEGER;
					a_y : INTEGER;
					a_fStyle : BIT 32) : BOOLEAN is
			-- The ImageList_Draw function draws an image list item
			-- in the specified device context.
		external "C use <windows.h>"
		end -- ImageList_Draw

	-- ImageList_DrawEx

	ImageList_DrawEx (a_himl : POINTER;
						a_i : INTEGER;
						a_hdcDst : POINTER;
						a_x : INTEGER;
						a_y : INTEGER;
						a_dx : INTEGER;
						a_dy : INTEGER;
						a_rgbBk : INTEGER;
						a_rgbFg : INTEGER;
						a_fStyle : INTEGER) : BOOLEAN is
			-- The ImageList_DrawEx function draws an image list
			-- item in the specified device context. The function
			-- uses the specified drawing style and blends the image
			-- with the specified color.
		external "C use <windows.h>"
		end -- ImageList_DrawEx

	-- ImageList_EndDrag

	ImageList_EndDrag : BOOLEAN is
			-- The ImageList_EndDrag function ends a drag operation.
		external "C use <windows.h>"
		end -- ImageList_EndDrag

	-- ImageList_ExtractIcon

	ImageList_ExtractIcon (a_hi : POINTER;
							a_himl : POINTER;
							a_i : INTEGER) : POINTER is
			-- The ImageList_ExtractIcon function creates an icon
			-- or cursor based on an image and mask in an image list.
			-- ImageList_ExtractIcon is a macro that calls the ImageList_GetIcon
			-- function.
		external "C use <windows.h>"
		end -- ImageList_ExtractIcon

	-- ImageList_GetBkColor

	ImageList_GetBkColor (a_himl : POINTER) : INTEGER is
			-- The ImageList_GetBkColor function retrieves the current
			-- background color for an image list.
		external "C use <windows.h>"
		end -- ImageList_GetBkColor

	-- ImageList_GetDragImage

	ImageList_GetDragImage (a_ppt_deref : POINTER;
							a_pptHotspot_deref : POINTER) : POINTER is
--	ImageList_GetDragImage (a_ppt_deref : WIN32_POINT;
--							a_pptHotspot_deref : WIN32_POINT) : POINTER is
			-- The ImageList_GetDragImage function retrieves the
			-- temporary image list that is used for the drag image.
			-- The function also retrieves the current drag position,
			-- and the offset of the drag image relative to the drag
			-- position.
		external "C use <windows.h>"
		end -- ImageList_GetDragImage

	-- ImageList_GetIcon

	ImageList_GetIcon (a_himl : POINTER;
						a_i : INTEGER;
						a_flags : BIT 32) : POINTER is
			-- The ImageList_GetIcon function creates an icon or
			-- cursor based on an image and mask in an image list.
		external "C use <windows.h>"
		end -- ImageList_GetIcon

	-- ImageList_GetIconSize

	ImageList_GetIconSize (a_himl : POINTER;
							a_cx_deref : POINTER;
							a_cy_deref : POINTER) : BOOLEAN is
			-- The ImageList_GetIconSize function retrieves the dimensions
			-- of images in an image list. All images in an image
			-- list have the same dimensions.
		require
			not_void__a_cx_deref : a_cx_deref.is_not_null
			not_void__a_cy_deref : a_cy_deref.is_not_null
		external "C use <windows.h>"
		end -- ImageList_GetIconSize

	-- ImageList_GetImageCount

	ImageList_GetImageCount (a_himl : POINTER) : INTEGER is
			-- The ImageList_GetImageCount function retrieves the
			-- number of images in an image list.
		external "C use <windows.h>"
		end -- ImageList_GetImageCount

	-- ImageList_GetImageInfo

	ImageList_GetImageInfo (a_himl : POINTER;
							a_i : INTEGER;
							a_pImageInfo_deref : POINTER) : BOOLEAN is
--	ImageList_GetImageInfo (a_himl : POINTER;
--							a_i : INTEGER;
--							a_pImageInfo_deref : WIN32_IMAGEINFO) : BOOLEAN is
			-- The ImageList_GetImageInfo function retrieves information
			-- about an image.
		external "C use <windows.h>"
		end -- ImageList_GetImageInfo

	-- ImageList_LoadBitmap

	ImageList_LoadBitmap (a_hi : POINTER;
							a_bmp : POINTER;
							a_cx : INTEGER;
							a_cGrow : INTEGER;
							a_crMask : INTEGER) : POINTER is
--	ImageList_LoadBitmap (a_hi : POINTER;
--							a_bmp : STRING;
--							a_cx : INTEGER;
--							a_cGrow : INTEGER;
--							a_crMask : INTEGER) : POINTER is
			-- The ImageList_LoadBitmap function creates an image
			-- list from the specified bitmap resource. ImageList_LoadBitmap
			-- is a macro that calls the ImageList_LoadImage function.
		external "C use <windows.h>"
		end -- ImageList_LoadBitmap

	-- ImageList_LoadImage

	ImageList_LoadImage (a_hi : POINTER;
							a_bmp : POINTER;
							a_cx : INTEGER;
							a_cGrow : INTEGER;
							a_crMask : INTEGER;
							a_uType : INTEGER;
							a_uFlags : BIT 32) : POINTER is
--	ImageList_LoadImage (a_hi : POINTER;
--							a_bmp : STRING;
--							a_cx : INTEGER;
--							a_cGrow : INTEGER;
--							a_crMask : INTEGER;
--							a_uType : INTEGER;
--							a_uFlags : BIT 32) : POINTER is
			-- The ImageList_LoadImage function creates an image
			-- list from the specified bitmap, cursor, or icon resource.
		external "C use <windows.h>"
		end -- ImageList_LoadImage

	-- ImageList_Merge

	ImageList_Merge (a_himl1 : POINTER;
						a_i1 : INTEGER;
						a_himl2 : POINTER;
						a_i2 : INTEGER;
						a_dx : INTEGER;
						a_dy : INTEGER) : POINTER is
			-- The ImageList_Merge function creates a new image by
			-- combining two existing images. The function also creates
			-- a new image list to store the image.
		external "C use <windows.h>"
		end -- ImageList_Merge

	-- ImageList_Read

	ImageList_Read (a_pstm : POINTER) : POINTER is
			-- The ImageList_Read function reads an image list from
			-- a stream.
		external "C use <windows.h>"
		end -- ImageList_Read

	-- ImageList_Remove

	ImageList_Remove (a_himl : POINTER;
						a_i : INTEGER) : BOOLEAN is
			-- The ImageList_Remove function removes an image from
			-- an image list.
		external "C use <windows.h>"
		end -- ImageList_Remove

	-- ImageList_Replace

	ImageList_Replace (a_himl : POINTER;
						a_i : INTEGER;
						a_hbmImage : POINTER;
						a_hbmMask : POINTER) : BOOLEAN is
			-- The ImageList_Replace function replaces an image in
			-- an image list with a new image.
		external "C use <windows.h>"
		end -- ImageList_Replace

	-- ImageList_ReplaceIcon

	ImageList_ReplaceIcon (a_himl : POINTER;
							a_i : INTEGER;
							a_hicon : POINTER) : INTEGER is
			-- The ImageList_ReplaceIcon function replaces an image
			-- with an icon or cursor.
		external "C use <windows.h>"
		end -- ImageList_ReplaceIcon

	-- ImageList_SetBkColor

	ImageList_SetBkColor (a_himl : POINTER;
							a_clrBk : INTEGER) : INTEGER is
			-- The ImageList_SetBkColor function sets the background
			-- color for an image list.
		external "C use <windows.h>"
		end -- ImageList_SetBkColor

	-- ImageList_SetDragCursorImage

	ImageList_SetDragCursorImage (a_himlDrag : POINTER;
									a_iDrag : INTEGER;
									a_dxHotspot : INTEGER;
									a_dyHotspot : INTEGER) : BOOLEAN is
			-- The ImageList_SetDragCursorImage function creates
			-- a new drag image by combining the specified image (typically
			-- a mouse cursor image) with the current drag image.
		external "C use <windows.h>"
		end -- ImageList_SetDragCursorImage

	-- ImageList_SetIconSize

	ImageList_SetIconSize (a_himl : POINTER;
							a_cx : INTEGER;
							a_cy : INTEGER) : BOOLEAN is
			-- The ImageList_SetIconSize function sets the dimensions
			-- of images in an image list and removes all images from
			-- the list.
		external "C use <windows.h>"
		end -- ImageList_SetIconSize

	-- ImageList_SetOverlayImage

	ImageList_SetOverlayImage (a_himl : POINTER;
								a_iImage : INTEGER;
								a_iOverlay : INTEGER) : BOOLEAN is
			-- The ImageList_SetOverlayImage function adds the index
			-- of an image to the list of images to be used as overlay
			-- masks. Up to four indices can be added to the list.
		external "C use <windows.h>"
		end -- ImageList_SetOverlayImage

	-- ImageList_Write

	ImageList_Write (a_himl : POINTER;
						a_pstm : POINTER) : BOOLEAN is
			-- The ImageList_Write function writes an image list
			-- to a stream.
		external "C use <windows.h>"
		end -- ImageList_Write

end -- class WIN32_IMAGELIST_FUNCTIONS
