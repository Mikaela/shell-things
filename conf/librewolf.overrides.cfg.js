// ~/.{librewolf,var/app/io.gitlab.librewolf-community/.librewolf}/librewolf.overrides.cfg

// LibreWolf override configuration, begins with samples from
// https://librewolf.net/docs/settings/
// Also incorporates some of https://aminda.eu/browser-extensions#firefox-aboutconfig

// -----
// I often need to refer to these options which aren't yet remembered by heart

// Note to self on disabling protection of Mozilla pages. This may be a
// LibreWolf default so thus commented:
// via https://www.ghacks.net/2017/10/27/how-to-enable-firefox-webextensions-on-mozilla-websites/
//defaultPref("extensions.webextensions.restrictedDomains", "");
//defaultPref("privacy.resistFingerprinting.block_mozAddonManage", true);

// Block cookie banners. Warning: may result to auto-accepting cookies.
// https://www.ghacks.net/2022/12/24/configure-firefox-to-reject-cookie-banners-automatically/
defaultPref("cookiebanners.service.mode", 2);
defaultPref("cookiebanners.service.mode.privateBrowsing", 2);
defaultPref("cookiebanners.bannerClicking.enabled", true);

// https://globalprivacycontrol.org/ the successor of DNT
defaultPref("privacy.globalprivacycontrol.enabled", true);
defaultPref("privacy.globalprivacycontrol.functionality.enabled", true);
// and DNT itself
defaultPref("privacy.donottrackheader.enabled", true);
defaultPref("privacy.donottrackheader.value", 1);

// -----

// I would like to use this, but forced light mode is a dealbreaker
// (floaters), UTC makes Mobilizon difficult, Privacy Badger blocks 3rd party
// canvas and I want to appear as a Finnish Linux user rather than English
// Windows NT one (telemetry, voting vs spying).
defaultPref("privacy.resistFingerprinting", true);
// Or I could excempt things from it? Other than it not overriding timezone.
defaultPref("privacy.resistFingerprinting.testGranularityMask", 4);
defaultPref(
	"privacy.resistFingerprinting.exemptedDomains",
	"jarkkaa.fi,*.element.io,*.google.com,*.pikaviestin.fi,*.envs.net,*.wikimedia.org,*.wikipedia.org,*.duckduckgo.com,*.blesmrt.net,*.piraatit.fi,*.piraattipuolue.fi,*.apple.com",
);

// Enable letterboxing
defaultPref("privacy.resistFingerprinting.letterboxing", true);

// Enable Firefox accounts
defaultPref("identity.fxaccounts.enabled", true);

// Settings on what to clear on quit
// - Goal: let Element Web & co stay logged in
defaultPref("privacy.clearOnShutdown.cache", false);
defaultPref("privacy.clearOnShutdown.cookies", false);
defaultPref("privacy.clearOnShutdown.history", false);
defaultPref("privacy.clearOnShutdown.offlineApps", false);
defaultPref("privacy.clearOnShutdown.openWindows", false);
defaultPref("privacy.clearOnShutdown.sessions", false);
defaultPref("privacy.clearOnShutdown.siteSettings", false);

// Don't resume from crash (SSD)
defaultPref("browser.sessionstore.resume_from_crash", false);

// Stricter autoplay
defaultPref("media.autoplay.blocking_policy", 2);

// No corporate CA MITM
defaultPref("security.certerrors.mitm.auto_enable_enterprise_roots", false);

// Decrease animations
defaultPref("image.animation_mode", "once");

// Punycode
defaultPref("network.IDN_show_punycode", true);

// Enforce reader mode enabling?
defaultPref("reader.parse-on-load.force-enabled", true);

// TRR & ECH
// Mode 2 allows fallback to system resolver, 3 is TTR-only
//defaultPref("network.trr.mode", 2);
defaultPref("network.trr.mode", 3);
defaultPref("network.trr.early-AAAA", true);
defaultPref("network.trr.uri", "https://dns0.eu");
//defaultPref("network.trr.uri", "https://dns.adguard-dns.com/dns-query");
// NOTE: ECH requires TRR, so mode 2 may not use it.
defaultPref("network.trr.disable-ECS", false);
defaultPref("network.dns.echconfig.enabled", true);
defaultPref("network.dns.use_https_rr_as_altsvc", true);
defaultPref("network.trr.exclude-etc-hosts", false);
defaultPref(
	"network.trr.excluded-domains",
	"http.badssl.com,norwegianwifi.com,mywifiext.net,tplinkrepeater.net,router.asus.com",
);

// Default UI scale
defaultPref("layout.css.devPixelsPerPx", "1.5");

// Keep cache on both disk & memory. This is required for
// https://github.com/JimmXinu/FanFicFare/wiki/BrowserCacheFeature
defaultPref("browser.cache.disk.enable", true);
defaultPref("browser.cache.memory.enable", true);

// Start from homepage, don't restore the previous session (excluding pinned tabs)'
defaultPref("browser.startup.page", 1);
// Simplified DDG experience without prompts for extension and all
defaultPref("browser.startup.homepage", "https://start.duckduckgo.com");

// vim: filetype=javascript
