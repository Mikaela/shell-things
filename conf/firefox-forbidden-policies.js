//
// Remember to start writing at line 2. This is my second attempt at Firefox
// autoconfig after being taught by LibreAwoo, but this time I am trying to
// avoid duplicating my browser policy, which you can find from the same
// repository, etc/firefox/policies/policies.json

// If autoconfig is not found, fallback. Also means this file.
lockPref("autoadmin.failover_to_cached", true);
lockPref(
	"autoadmin.global_config_url",
	"https://codeberg.org/Aminda/shell-things/raw/branch/cxefa/conf/firefox-forbidden-policies.js",
);
lockPref("autoadmin.offline_failover", true);
lockPref("autoadmin.refresh_interval", 120);

// Automatically click cookiebanners although uBlock Origin might block them
lockPref("cookiebanners.bannerClicking.enabled", true);
lockPref("cookiebanners.service.mode", 2);
lockPref("cookiebanners.service.mode.privateBrowsing", 2);

// I can set my preferred fonts in an order! :O
// but obviously this is forbidden in policies.json!
lockPref(
	"font.name-list.monospace.x-cyrillic",
	"ui-monospace, Roboto Mono, Liberation Mono, Noto Sans Mono, monospace",
);
lockPref(
	"font.name-list.monospace.x-western",
	"ui-monospace, Roboto Mono, Liberation Mono, Noto Sans Mono, monospace",
);
lockPref(
	"font.name-list.sans-serif.x-cyrillic",
	"ui-sans-serif, system-ui, Inclusive Sans, Roboto, Liberation Sans, Noto Sans, sans-serif",
);
lockPref(
	"font.name-list.sans-serif.x-western",
	"ui-sans-serif, system-ui, Inclusive Sans, Liberation Sans, Comic Neue, Roboto, Noto Sans, sans-serif",
);
lockPref(
	"font.name-list.serif.x-cyrillic",
	"ui-serif, Liberation Serif, Roboto Serif, Noto Serif, serif",
);
lockPref(
	"font.name-list.serif.x-western",
	"ui-serif, Liberation Serif, Roboto Serif, Noto Serif, serif",
);
// clearPref("font.name-list.monospace.x-cyrillic");
// clearPref("font.name-list.monospace.x-western");
// clearPref("font.name-list.sans-serif.x-cyrillic");
// clearPref("font.name-list.sans-serif.x-western");
// clearPref("font.name-list.serif.x-cyrillic");
// clearPref("font.name-list.serif.x-western");
//
// Allow these fonts regardless of the fingerprinting resistance
// lockPref(
// 	"font.system.whitelist",
// 	"Arimo, Comic Neue, Comic Neue Angular, Comic Neue Angular Light, Comic Neue Angular Light Italic, Comic Neue Light, Cousine, Inclusive Sans, Liberation Mono, Liberation Sans, Liberation Serif, Noto Color Emoji, Noto Emoji, Noto Math, Noto Mono, Noto Sans, Noto Sans CJK JP, Noto Music, Roboto, Roboto Flex, Roboto Mono, Roboto Serif, Tinos, Twemoji Mozilla",
// );
clearPref("font.system.whitelist");

// Play animated images only once, accessibility. TODO: Which is the correct one? Update policies.json too!
lockPref("image.animation.mode", "once");
lockPref("image.animation_mode", "once");

// Spoof en-US as language to scripts
lockPref("javascript.use_us_english_locale", true);

// DNT although PrivacyBadger from policy handles this
lockPref("privacy.donottrackheader.enabled", true);
lockPref("privacy.donottrackheader.value", 1);

// More tunable privacy.resistfingerprinting. I have lost the privacy game
// many times before this point, so this is nothing.  For the options,
// refer to https://searchfox.org/mozilla-central/source/toolkit/components/resistfingerprinting/RFPTargets.inc
lockPref("privacy.fingerprintingProtection", true);
// Somehow I cannot clearPref this, so...
//clearPref("privacy.fingerprintingProtection");
//lockPref("privacy.fingerprintingProtection", false);
pref(
	"privacy.fingerprintingProtection.overrides",
	"+AllTargets,-KeyboardEvents,-CSSPrefersColorScheme,-CSSPrefersReducedMotion,-JSDateTimeUTC",
);
//clearPref("privacy.fingerprintingProtection.overrides");
lockPref("privacy.fingerprintingProtection.pbmode", true);
//clearPref("privacy.fingerprintingProtection.pbmode");
// (Incompatible with the above)
lockPref("privacy.resistFingerprinting", false);
//clearPref("privacy.resistFingerprinting");
// Breaks installing extensions when true at least on Android
//lockPref("privacy.resistFingerprinting.block_mozAddonManager", false);
clearPref("privacy.resistFingerprinting.block_mozAddonManage");
// Letterboxing from Tor Browser, I like it in general.
lockPref("privacy.resistFingerprinting.letterboxing", true);
// Still Incompatible with the above
//lockPref("privacy.resistFingerprinting.pbmode", false);
clearPref("privacy.resistFingerprinting.pbmode");

// Enables reading mode for all pages (at least in theory)
lockPref("reader.parse-on-load.force-enabled", true);

// Ensure OCSP stapling is enabled, especially if the server has it
lockPref("security.ssl.enable_ocsp_must_staple", true);

// Distributed Aggregation Protocol for Privacy Preserving Measurement
// https://github.com/ietf-wg-ppm/draft-ietf-ppm-dap
// This should be better for privacy with telemetry enabled.
lockPref("toolkit.telemetry.dap_enabled", true);

// New sidebar
lockPref("sidebar.revamp", true);
lockPref("sidebar.verticalTabs", true);
lockPref("sidebar.visibility", "always-show");

// Tab groups. TODO: Are these allowed? I am on ESR, so it does nothing yet.
lockPref("browser.tabs.groups.enabled", true);

// No making configuration on the last line of the file!
//
