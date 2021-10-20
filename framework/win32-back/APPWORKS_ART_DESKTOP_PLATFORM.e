class APPWORKS_ART_DESKTOP_PLATFORM

feature

	change_native_wallpaper (wppath: STRING) is
		do
--			SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, wppath.to_external, 0)
			--SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, SETWALLPAPER_DEFAULT, 0) -- same as NULL
			--SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, "", 0) -- clear wallpaper
			
			--SPI_GETCURSORSHADOW
			--SPI_GETMENUFADE
		end -- change_native_wallpaper

end -- class APPWORKS_ART_DESKTOP_PLATFORM
