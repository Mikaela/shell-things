-- Fedora: install pipewire-codec-aptx (from rpmfusion-free-updates)
-- https://steamdecki.org/Steam_Deck/Wireless/Bluetooth#Enabling_More_Codecs_and_Enabling_Headsets
-- Note to self: don't start limiting the codecs, just select the correct one
-- from pavucontrol, it will be remembered. SteamOS: add pavucontrol as a
-- non-Steam game for management in big picture mode.
bluez_monitor.properties = {
	["bluez5.enable-sbc-xq"] = true,
	["bluez5.enable-msbc"] = true,
	-- The default is all, but for some reason that removes all the high
	-- quality codecs.
	["bluez5.codecs"] = "[sbc sbc_xq aac ldac aptx aptx_hd aptx_ll aptx_ll_duplex faststream faststream_duplex]",
}
