//
// Remember to start writing at line 2. This is my second attempt at Firefox
// autoconfig after being taught by LibreAwoo, but this time I am trying to
// avoid duplicating my browser policy, which you can find from the same
// repository, etc/firefox/policies/policies.json

// If autoconfig is not found, fallback. Also means this file.
lockPref("autoadmin.failover_to_cached", true);
lockPref(
	"autoadmin.global_config_url",
	"https://gitea.blesmrt.net/mikaela/shell-things/raw/branch/master/conf/firefox-forbidden-policies.js",
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
	"Noto Shanns Mono, monospace",
);
lockPref("font.name-list.monospace.x-western", "Noto Shanns Mono, monospace");
lockPref("font.name-list.sans-serif.x-cyrillic", "Noto Sans, sans-serif");
lockPref("font.name-list.sans-serif.x-western", "Noto Sans, sans-serif");
lockPref("font.name-list.serif.x-cyrillic", "Noto Serif, serif");
lockPref("font.name-list.serif.x-western", "Noto Serif, serif");

// Play animated images only once, accessibility.
lockPref("image.animation.mode", "once");

// Spoof en-US as language to scripts
lockPref("javascript.use_us_english_locale", true);

// DNT although PrivacyBadger from policy handles this
lockPref("privacy.donottrackheader.enabled", true);
lockPref("privacy.donottrackheader.value", 1);

// More tunable privacy.resistfingerprinting. I have lost the privacy game
// many times before this point, so this is nothing.
//lockPref("privacy.fingerprintingProtection", true);

// Somehow I cannot clearPref this, so...
//clearPref("privacy.fingerprintingProtection");
lockPref("privacy.fingerprintingProtection", false);

//pref(
//	"privacy.fingerprintingProtection.overrides",
//	"+AllTargets,-KeyboardEvents,-SpeechSynthesis,-CSSPrefersColorScheme,-CSSPrefersReducedMotion,-NavigatorPlatform,-NavigatorUserAgent,-JSDateTimeUTC,-HttpUserAgent,-FontVisibilityRestrictGenerics,-FontVisibilityBaseSystem,-FontVisibilityLangPack",
//);
clearPref("privacy.fingerprintingProtection.overrides");
//lockPref("privacy.fingerprintingProtection.pbmode", true);
clearPref("privacy.fingerprintingProtection.pbmode");
// (Incompatible with the above)
//lockPref("privacy.resistFingerprinting", false);
clearPref("privacy.resistFingerprinting");
//lockPref("privacy.resistFingerprinting.block_mozAddonManage", true);
clearPref("privacy.resistFingerprinting.block_mozAddonManage");
// Letterboxing from Tor Browser, I like it in general.
lockPref("privacy.resistFingerprinting.letterboxing", true);
// Still Incompatible with the above
//lockPref("privacy.resistFingerprinting.pbmode", false);
clearPref("privacy.resistFingerprinting.pbmode");

// Which extension requires container tabs? My policy and this file. This
// particular option is so forbidden, it cannot be set either in the policy
// or autoconfig.js
lockPref("privacy.userContext.extension", "");
// Enable containers without extensions (although those are forced by the
// policy. TODO: Remove these as they are in the policy, but disallowed by
// current ESR
lockPref("privacy.userContext.enabled", true);
lockPref("privacy.userContext.ui.enabled", true);

// Enables reading mode for all pages (at least in theory)
lockPref("reader.parse-on-load.force-enabled", true);

// Ensure OCSP stapling is enabled, especially if the server has it
lockPref("security.ssl.enable_ocsp_must_staple", true);

// TODO: Consider removing this when ESR updates as only it needs this for
// ECH, which is otherwise the default=
lockPref("security.tls.ech.grease_http3", true);

// No making configuration on the last line of the file!
//
