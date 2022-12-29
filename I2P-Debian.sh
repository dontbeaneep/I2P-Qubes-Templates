#! /bin/bash

clear
printf 'Hello! Make sure you are ROOT before we continue.\nAre you ROOT? (y/n): '
while :; do
	read -r root
	case "$root" in
		y )
			printf 'Good, running as ROOT is essential.\n '
			break
			;;
		n )
			printf 'Quitting now. RUN AS ROOT.\n '
			sleep 2
			exit
			break
			;;
		* )
			printf 'Try Again\n '
	esac
done

echo -en "When the I2P configuration prompt pops up, the default settings are best.\nBut feel free to customize it yourself if you know what you are doing...\n\n"
sleep 5

printf 'Which template is this: \nEnter 1 for Debian/Ubuntu\nEnter 2 for Whonix WS\n: '
while :; do
	read -r response1
	case "$response1" in
		1 )
			printf 'You chose Debian.\n ';
			break
			;;
		2 )
			printf 'You chose Whonix.\n ';
			break
			;;
		* )
			printf 'Try Again\n '
	esac
done

printf 'Do you want your Router Console preconfigured? You can always customize it later. \n(y/n): '
while :; do
	read -r response2
	case "$response2" in
		y )
			printf 'You chose yes!\n ';
			break
			;;
		n )
			printf 'You chose no!\n '; 
			break
			;;
		* )
			printf 'Try Again\n '
	esac
done

printf 'Running the scripts you specified...\n ';
while :; do
	case "$response1$response2" in 
		1y) 
			echo -en "Now installing I2P-Java and LibreWolf on a Debian-11 template.\n ";
			sleep 3;
			apt-get update;
			curl --proxy http://127.0.0.1:8082 --tlsv1.2 https://geti2p.net/_static/i2p-archive-keyring.gpg | gpg --dearmor | tee /usr/share/keyrings/i2p-archive-keyring.gpg > /dev/null; 
			curl --proxy http://127.0.0.1:8082 --tlsv1.2 https://deb.librewolf.net/keyring.gpg | gpg --dearmor | tee /usr/share/keyrings/librewolf.gpg > /dev/null;
			echo "deb [signed-by=/usr/share/keyrings/i2p-archive-keyring.gpg] https://deb.i2p2.de/ bullseye main" | tee /etc/apt/sources.list.d/i2p.list > /dev/null && 
			echo "deb [arch=amd64 signed-by=/usr/share/keyrings/librewolf.gpg] http://deb.librewolf.net bullseye main" | tee /etc/apt/sources.list.d/librewolf.list > /dev/null &&
			apt-get update; 
			apt-get install i2p i2p-keyring librewolf -y;
			dpkg-reconfigure i2p &&
			echo -e "i2np.inboundBurstKBytes.bandwidth=178379 \ni2np.bandwidth.inboundBurstKBytesPerSecond=8919 \ni2np.bandwidth.inboundKBytesPerSecond=8869 \ni2np.bandwidth.outboundBurstKBytes=23301 \ni2np.bandwidth.outboundBurstKBytesPerSecond=1165 \ni2np.bandwidth.outboundKBytesPerSecond=1115 \ni2np.lastCountry=us \ni2np.udp.internalPort=18729 \ni2np.udp.port=18729 \njbigi.lastProcessor=Kaby Lake Core i3/i5/i7/64 \nrouter.firstVersion=1.9.0 \nrouter.passwordManager.migrated=true \nrouter.previousVersion=2.0.0 \nrouter.sharePercentage=80 \nrouter.startup.jetty9.migrated=true \nrouter.updateDisabled=true \nrouterconsole.country= \nrouterconsole.lang=en \nrouterconsole.newsLastNewEntry=0 \nrouterconsole.newsLastUpdated=0 \nrouterconsole.theme=dark \nrouterconsole.welcomeWizardComplete=true" | tee router.txt > /dev/null; 
			cat router.txt >> /var/lib/i2p/i2p-config/router.config;
			systemctl enable i2p; 
			systemctl restart i2p;
			apt update && 
			apt upgrade -y; 
			break
			;; 
		1n) 
			echo -en "Now installing I2P-Java and LibreWolf on a Debian-11 template.\n " ;
			sleep 3;
			apt-get update;
			curl --proxy http://127.0.0.1:8082 --tlsv1.2 https://geti2p.net/_static/i2p-archive-keyring.gpg | gpg --dearmor | tee /usr/share/keyrings/i2p-archive-keyring.gpg > /dev/null; 
			curl --proxy http://127.0.0.1:8082 --tlsv1.2 https://deb.librewolf.net/keyring.gpg | gpg --dearmor | tee /usr/share/keyrings/librewolf.gpg > /dev/null;
			echo "deb [signed-by=/usr/share/keyrings/i2p-archive-keyring.gpg] https://deb.i2p2.de/ bullseye main" | tee /etc/apt/sources.list.d/i2p.list > /dev/null && 
			echo "deb [arch=amd64 signed-by=/usr/share/keyrings/librewolf.gpg] http://deb.librewolf.net bullseye main" | tee /etc/apt/sources.list.d/librewolf.list > /dev/null &&
			apt-get update; 
			apt-get install i2p i2p-keyring librewolf -y;
			dpkg-reconfigure i2p && 
			systemctl enable i2p; 
			systemctl restart i2p;
			apt update && 
			apt upgrade -y;
			break 
			;; 
		2y) 
			echo -en "Now installing I2P-Java and LibreWolf on a Whonix-16 WS template.\n ";
			sleep 3;
			scurl --proxy http://127.0.0.1:8082 --tlsv1.2 https://geti2p.net/_static/i2p-archive-keyring.gpg | gpg --dearmor | tee /usr/share/keyrings/i2p-archive-keyring.gpg > /dev/null;
			scurl --proxy http://127.0.0.1:8082 --tlsv1.2 https://deb.librewolf.net/keyring.gpg | gpg --dearmor | tee /usr/share/keyrings/librewolf.gpg > /dev/null; 
			echo "deb [signed-by=/usr/share/keyrings/i2p-archive-keyring.gpg] tor+https://deb.i2p2.de/ bullseye main" | tee /etc/apt/sources.list.d/i2p.list > /dev/null; 
			echo "deb [arch=amd64 signed-by=/usr/share/keyrings/librewolf.gpg] tor+http://deb.librewolf.net bullseye main" | tee /etc/apt/sources.list.d/librewolf.list > /dev/null;
			apt-get update; 
			apt-get install i2p i2p-keyring librewolf -y; 
			dpkg-reconfigure i2p &&
			systemctl enable i2p;
			echo -e "#! /bin/bash \necho -e \"i2np.inboundBurstKBytes.bandwidth=178379 \ni2np.bandwidth.inboundBurstKBytesPerSecond=8919 \ni2np.bandwidth.inboundKBytesPerSecond=8869 \ni2np.bandwidth.outboundBurstKBytes=23301 \ni2np.bandwidth.outboundBurstKBytesPerSecond=1165 \ni2np.bandwidth.outboundKBytesPerSecond=1115 \ni2np.lastCountry=us \ni2np.udp.internalPort=18729 \ni2np.udp.port=18729 \njbigi.lastProcessor=Kaby Lake Core i3/i5/i7/64 \nrouter.firstVersion=1.9.0 \nrouter.passwordManager.migrated=true \nrouter.previousVersion=2.0.0 \nrouter.sharePercentage=80 \nrouter.startup.jetty9.migrated=true \nrouter.updateDisabled=true \nrouterconsole.country= \nrouterconsole.lang=en \nrouterconsole.newsLastNewEntry=0 \nrouterconsole.newsLastUpdated=0 \nrouterconsole.theme=dark \nrouterconsole.welcomeWizardComplete=true\" | tee router.txt > /dev/null; cat router.txt >> /var/lib/i2p/i2p-config/router.config; systemctl restart i2p" | tee /router-config.sh > /dev/null; 
			chmod +x /router-config.sh;
			systemctl restart i2p;
			apt update;
			apt upgrade -y;
			printf 'Unfortunately, I cannot customize your Router Console until you create a new Whonix WS AppVM. Create a new AppVM, become root, and then run "bash /router-config.sh". This is a temporary workaround but it works.\n\n '
			sleep 6
			break
			;; 
		2n) 
			echo -en "Now installing I2P-Java and LibreWolf on a Whonix-16 WS template.\n ";
			sleep 3;
			scurl --proxy http://127.0.0.1:8082 --tlsv1.2 https://geti2p.net/_static/i2p-archive-keyring.gpg | gpg --dearmor | tee /usr/share/keyrings/i2p-archive-keyring.gpg > /dev/null;
			scurl --proxy http://127.0.0.1:8082 --tlsv1.2 https://deb.librewolf.net/keyring.gpg | gpg --dearmor | tee /usr/share/keyrings/librewolf.gpg > /dev/null; 
			echo "deb [signed-by=/usr/share/keyrings/i2p-archive-keyring.gpg] tor+https://deb.i2p2.de/ bullseye main" | tee /etc/apt/sources.list.d/i2p.list > /dev/null; 
			echo "deb [arch=amd64 signed-by=/usr/share/keyrings/librewolf.gpg] tor+http://deb.librewolf.net bullseye main" | tee /etc/apt/sources.list.d/librewolf.list > /dev/null;
			apt-get update; 
			apt-get install i2p i2p-keyring librewolf -y; 
			dpkg-reconfigure i2p &&
			systemctl enable i2p;
			systemctl restart i2p;
			apt update;
			apt upgrade -y;
			break
			;; 
		*) 
			printf 'Try again\n '
	esac
done

echo -en "
/** LIBREWOLF SETTINGS
 * 
 * take the time to read and understand, but also to customize the settings to find your own setup.
 * the answers to the most common questions can be found at https://librewolf.net/docs/faq/.
 * 
 * WARNING: make sure the first line of this file is empty. this is a known bug.
 */
lockPref(\"librewolf.cfg.version\", \"7.3\");


/** INDEX
 * the file is organized in categories, and each one has a number of sections:
 * 
 * PRIVACY [ISOLATION, SANITIZING, CACHE AND STORAGE, HISTORY AND SESSION RESTORE, QUERY STRIPPING]
 * NETWORKING [HTTPS, REFERERS, WEBRTC, PROXY, DNS, PREFETCHING AND SPECULATIVE CONNECTIONS]
 * FINGERPRINTING [RFP, WEBGL]
 * SECURITY [SITE ISOLATION, CERTIFICATES, TLS/SSL, PERMISSIONS, SAFE BROWSING, OTHERS]
 * REGION [LOCATION, LANGUAGE]
 * BEHAVIOR [DRM, SEARCH AND URLBAR, DOWNLOADS, AUTOPLAY, POP-UPS AND WINDOWS, MOUSE]
 * EXTENSIONS [USER INSTALLED, SYSTEM, EXTENSION FIREWALL]
 * BUILT-IN FEATURES [UPDATER, SYNC, LOCKWISE, CONTAINERS, DEVTOOLS, OTHERS]
 * UI [BRANDING, HANDLERS, FIRST LAUNCH, NEW TAB PAGE, ABOUT, RECOMMENDED]
 * TELEMETRY
 * WINDOWS [UPDATES, OTHERS]
 */



/** [CATEGORY] PRIVACY */

/** [SECTION] ISOLATION
 * default to strict mode, which includes:
 * 1. dFPI for both normal and private windows
 * 2. strict blocking lists for trackers
 * 3. shims to avoid breakage caused by blocking lists
 * 4. stricter policies for xorigin referrers
 * 5. dFPI specific cookie cleaning mechanism
 * 6. query stripping
 * 
 * the desired category must be set with pref() otherwise it won't stick.
 * the UI that allows to change mode manually is hidden.
 */
pref(\"browser.contentblocking.category\", \"strict\");
// enable APS
defaultPref(\"privacy.partition.always_partition_third_party_non_cookie_storage\", true);
defaultPref(\"privacy.partition.always_partition_third_party_non_cookie_storage.exempt_sessionstorage\", false);  

/** [SECTION] SANITIZING 
 * all the cleaning prefs true by default except for siteSetting and offlineApps,
 * which is what we want. users should set manual exceptions in the UI if there
 * are cookies they want to keep.
 */
defaultPref(\"privacy.clearOnShutdown.offlineApps\", true);
defaultPref(\"privacy.clearOnShutdown.history\", true); 
defaultPref(\"privacy.clearOnShutdown.downloads\", true); 
defaultPref(\"privacy.sanitize.sanitizeOnShutdown\", true);
defaultPref(\"privacy.sanitize.timeSpan\", 0);

/** [SECTION] CACHE AND STORAGE */
defaultPref(\"browser.cache.disk.enable\", false); // disable disk cache
/** prevent media cache from being written to disk in pb, but increase max cache size to avoid playback issues */
defaultPref(\"browser.privatebrowsing.forceMediaMemoryCache\", true);
defaultPref(\"media.memory_cache_max_size\", 65536);
// disable favicons in profile folder and page thumbnail capturing
defaultPref(\"browser.shell.shortcutFavicons\", false);
defaultPref(\"browser.pagethumbnails.capturing_disabled\", true);
defaultPref(\"browser.helperApps.deleteTempFileOnExit\", true); // delete temporary files opened with external apps

/** [SECTION] HISTORY AND SESSION RESTORE
 * since we hide the UI for modes other than custom we want to reset it for
 * everyone. same thing for always on PB mode.
 */
pref(\"privacy.history.custom\", true);
defaultPref(\"browser.sessionstore.resume_from_crash\", false); 
pref(\"browser.privatebrowsing.autostart\", false);
defaultPref(\"browser.formfill.enable\", false); // disable form history
defaultPref(\"browser.sessionstore.privacy_level\", 2); // prevent websites from storing session data like cookies and forms

/** [SECTION] QUERY STRIPPING
 * currently we set the same query stripping list that brave uses:
 * https://github.com/brave/brave-core/blob/f337a47cf84211807035581a9f609853752a32fb/browser/net/brave_site_hacks_network_delegate_helper.cc#L29
 */
defaultPref(\"privacy.query_stripping.strip_list\", \"__hsfp __hssc __hstc __s _hsenc _openstat dclid fbclid gbraid gclid hsCtaTracking igshid mc_eid ml_subscriber ml_subscriber_hash msclkid oft_c oft_ck oft_d oft_id oft_ids oft_k oft_lk oft_sk oly_anon_id oly_enc_id rb_clickid s_cid twclid vero_conv vero_id wbraid wickedid yclid\");
/**
 * librewolf specific pref that allows to include the query stripping lists in uBO by default.
 * the asset file is fetched every 7 days.
 */
defaultPref(\"librewolf.uBO.assetsBootstrapLocation\", \"https://gitlab.com/librewolf-community/browser/source/-/raw/main/assets/uBOAssets.json\");



/** [CATEGORY] NETWORKING */

/** [SECTION] HTTPS */
defaultPref(\"dom.security.https_only_mode\", false); // only allow https in all windows, including private browsing
defaultPref(\"dom.security.https_first\", false); 
defaultPref(\"dom.security.https_first_pbm\", false);
defaultPref(\"network.auth.subresource-http-auth-allow\", 1); // block HTTP authentication credential dialogs

/** [SECTION] REFERERS
 * to enhance privacy but keep a certain level of usability we trim cross-origin
 * referers to only send scheme, host and port, instead of completely avoid sending them.
 * as a general rule, the behavior of referes which are not cross-origin should not
 * be changed.
 */
defaultPref(\"network.http.referer.XOriginTrimmingPolicy\", 2);

/** [SECTION] WEBRTC
 * there's no point in disabling webrtc as mDNS protects the private IP on linux, osx and win10+.
 * with the below preference we protect the value even in trusted environments and for win7/8 users,
 * although this will likely cause breakage.
 */
defaultPref(\"media.peerconnection.ice.no_host\", true); // don't use any private IPs for ICE candidate
defaultPref(\"media.peerconnection.ice.default_address_only\", true); // use a single interface for ICE candidates, the vpn one when a vpn is used
defaultPref(\"media.peerconnection.enabled\", false); 
defaultPref(\"media.navigator.enabled\", false); 
defaultPref(\"media.getusermedia.aec_enabled\", false); 
defaultPref(\"media.getusermedia.agc_enabled\", false);  


/** [SECTION] PROXY */
defaultPref(\"network.gio.supported-protocols\", \"\"); // disable gio as it could bypass proxy
defaultPref(\"network.file.disable_unc_paths\", true); // hidden, disable using uniform naming convention to prevent proxy bypass
defaultPref(\"network.proxy.socks_remote_dns\", false); // forces dns query through the proxy when using one
defaultPref(\"media.peerconnection.ice.proxy_only_if_behind_proxy\", true); // force webrtc inside proxy when one is used
defaultPref(\"network.proxy.http\", \"127.0.0.1\"); 
defaultPref(\"network.proxy.http_port\", 4444); 
defaultPref(\"network.proxy.https\", \"127.0.0.1\"); 
defaultPref(\"network.proxy.https_port\", 4444); 
defaultPref(\"network.proxy.socks\", \"127.0.0.1\"); 
defaultPref(\"network.proxy.socks_port\", 4444); 
defaultPref(\"network.proxy.no_proxies_on\", \"http://localhost:7657\");  
defaultPref(\"network.proxy.type\", 1); 


/** [SECTION] DNS */
defaultPref(\"network.trr.confirmationNS\", \"skip\"); // skip undesired doh test connection
defaultPref(\"network.dns.disablePrefetch\", true); // disable dns prefetching
/**
 * librewolf does not use DoH, but it can be enabled with the following prefs:
 * pref(\"network.trr.mode\", 2);
 * pref(\"network.trr.uri\", \"https://dns.quad9.net/dns-query\");
 * 
 * the possible modes are:
 * 0 = default
 * 1 = browser picks faster
 * 2 = DoH with system dns fallback
 * 3 = DoH without fallback
 * 5 = DoH is off, default currently
 */

/** [SECTION] PREFETCHING AND SPECULATIVE CONNECTIONS
 * disable prefecthing for different things such as links, bookmarks and predictions.
 */
pref(\"network.predictor.enabled\", false);
pref(\"network.prefetch-next\", false);
pref(\"network.http.speculative-parallel-limit\", 0);
defaultPref(\"browser.places.speculativeConnect.enabled\", false);
// disable speculative connections and domain guessing from the urlbar
defaultPref(\"browser.urlbar.speculativeConnect.enabled\", false);



/** [CATEGORY] FINGERPRINTING */

/** [SECTION] RFP
 * librewolf should stick to RFP for fingerprinting. we should not set prefs that interfere with it
 * and disabling API for no good reason will be counter productive, so it should also be avoided.  
 */
defaultPref(\"privacy.resistFingerprinting\", true);
// rfp related settings
defaultPref(\"privacy.resistFingerprinting.block_mozAddonManager\", true); // prevents rfp from breaking AMO
defaultPref(\"browser.startup.blankWindow\", false); // if set to true it breaks RFP windows resizing
defaultPref(\"browser.display.use_system_colors\", false); // default, except Win
defaultPref(\"javascript.enabled\", false); 
/**
 * increase the size of new RFP windows for better usability, while still using a rounded value.
 * if the screen resolution is lower it will stretch to the biggest possible rounded value.
 * also, expose hidden letterboxing pref but do not enable it for now.
 */
defaultPref(\"privacy.window.maxInnerWidth\", 1600);
defaultPref(\"privacy.window.maxInnerHeight\", 900);
defaultPref(\"privacy.resistFingerprinting.letterboxing\", true);

/** [SECTION] WEBGL */
defaultPref(\"webgl.disabled\", true);



/** [CATEGORY] SECURITY */

/** [SECTION] CERTIFICATES */
defaultPref(\"security.cert_pinning.enforcement_level\", 2); // enable strict public key pinning, might cause issues with AVs
/**
 * enable safe negotiation and show warning when it is not supported. might cause breakage
 * if the the server does not support RFC 5746, in tha case SSL_ERROR_UNSAFE_NEGOTIATION
 * will be shown.
 */
defaultPref(\"security.ssl.require_safe_negotiation\", true);
defaultPref(\"security.ssl.treat_unsafe_negotiation_as_broken\", true);
/**
 * our strategy with revocation is to perform all possible checks with CRL, but when a cert
 * cannot be checked with it we use OCSP stapled with hard-fail, to still keep privacy and
 * increase security.
 * crlite is in mode 3 by default, which allows us to detect false positive with OCSP.
 * in v103, when crlite is fully mature, it will switch to mode 2 and no longer double-check.
 */
defaultPref(\"security.remote_settings.crlite_filters.enabled\", true);
defaultPref(\"security.OCSP.require\", true); // set to hard-fail, might cause SEC_ERROR_OCSP_SERVER_ERROR

/** [SECTION] TLS/SSL */
pref(\"security.tls.enable_0rtt_data\", false); // disable 0 RTT to improve tls 1.3 security
pref(\"security.tls.version.enable-deprecated\", false); // make TLS downgrades session only by enforcing it with pref()
defaultPref(\"browser.xul.error_pages.expert_bad_cert\", true); // show relevant and advanced issues on warnings and error screens

/** [SECTION] PERMISSIONS */
pref(\"permissions.delegation.enabled\", false); // force permission request to show real origin
pref(\"permissions.manager.defaultsUrl\", \"\"); // revoke special permissions for some mozilla domains

/** [SECTION] SAFE BROWSING
 * disable safe browsing, including the fetch of updates. reverting the 7 prefs below
 * allows to perform local checks and to fetch updated lists from google.
 */
defaultPref(\"browser.safebrowsing.malware.enabled\", false);
defaultPref(\"browser.safebrowsing.phishing.enabled\", false);
defaultPref(\"browser.safebrowsing.blockedURIs.enabled\", false);
defaultPref(\"browser.safebrowsing.provider.google4.gethashURL\", \"\");
defaultPref(\"browser.safebrowsing.provider.google4.updateURL\", \"\");
defaultPref(\"browser.safebrowsing.provider.google.gethashURL\", \"\");
defaultPref(\"browser.safebrowsing.provider.google.updateURL\", \"\");
/**
 * disable safe browsing checks on downloads, both local and remote. the resetting prefs
 * control remote checks, while the first one is for local checks only.
 */
defaultPref(\"browser.safebrowsing.downloads.enabled\", false);
pref(\"browser.safebrowsing.downloads.remote.enabled\", false);
pref(\"browser.safebrowsing.downloads.remote.block_potentially_unwanted\", false);
pref(\"browser.safebrowsing.downloads.remote.block_uncommon\", false);
 // empty for defense in depth
pref(\"browser.safebrowsing.downloads.remote.url\", \"\");
pref(\"browser.safebrowsing.provider.google4.dataSharingURL\", \"\");

/** [SECTION] OTHERS */
defaultPref(\"network.IDN_show_punycode\", true); // use punycode in idn to prevent spoofing
defaultPref(\"pdfjs.enableScripting\", false); // disable js scripting in the built-in pdf reader



/** [CATEGORY] REGION */

/** [SECTION] LOCATION
 * replace google with mozilla as the default geolocation provide and prevent use of OS location services
 */
defaultPref(\"geo.provider.network.url\", \"https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%\");
defaultPref(\"geo.provider.ms-windows-location\", false); // [WINDOWS]
defaultPref(\"geo.provider.use_corelocation\", false); // [MAC]
defaultPref(\"geo.provider.use_gpsd\", false); // [LINUX]
defaultPref(\"geo.provider.use_geoclue\", false); // [LINUX]

/** [SECTION] LANGUAGE
 * show language as en-US for all users, regardless of their OS language and browser language.
 * both prefs must use pref() and not defaultPref to work.
 */
pref(\"javascript.use_us_english_locale\", true);
pref(\"intl.accept_languages\", \"en-US, en\");
// disable region specific updates from mozilla
pref(\"browser.region.network.url\", \"\");
pref(\"browser.region.update.enabled\", false);



/** [CATEGORY] BEHAVIOR */

/** [SECTION] DRM */
defaultPref(\"media.eme.enabled\", false); // master switch for drm content
defaultPref(\"media.gmp-manager.url\", \"data:text/plain,\"); // prevent checks for plugin updates when drm is disabled
// disable the widevine and the openh264 plugins
defaultPref(\"media.gmp-provider.enabled\", false);
defaultPref(\"media.gmp-gmpopenh264.enabled\", false);

/** [SECTION] SEARCH AND URLBAR
 * disable search suggestion and do not update opensearch engines.
 */
defaultPref(\"browser.urlbar.suggest.searches\", false);
defaultPref(\"browser.search.suggest.enabled\", false);
defaultPref(\"browser.search.update\", false);
/**
 * the pref disables the whole feature and hide it from the ui
 * (as noted in https://bugzilla.mozilla.org/show_bug.cgi?id=1755057).
 * this also includes the best match feature, as it is part of firefox suggest.
 */
pref(\"browser.urlbar.quicksuggest.enabled\", false);

/** [SECTION] DOWNLOADS
 * user interaction should always be required for downloads, as a way to enhance security by asking
 * the user to specific a certain save location. 
 */
defaultPref(\"browser.download.useDownloadDir\", false);
defaultPref(\"browser.download.autohideButton\", false); // do not hide download button automatically
defaultPref(\"browser.download.manager.addToRecentDocs\", false); // do not add downloads to recents
defaultPref(\"browser.download.alwaysOpenPanel\", false); // do not expand toolbar menu for every download, we already have enough interaction

/** [SECTION] AUTOPLAY
 * block autoplay unless element is right-clicked. this means background videos, videos in a different tab,
 * or media opened while other media is played will not start automatically.
 * thumbnails will not autoplay unless hovered. exceptions can be set from the UI.
 */
defaultPref(\"media.autoplay.default\", 5);

/** [SECTION] POP-UPS AND WINDOWS
 * disable annoyin pop-ups and limit events that can trigger them.
 */
defaultPref(\"dom.popup_allowed_events\", \"click dblclick mousedown pointerdown\");
/**
 * prevent scripts from resizing existing windows and opening new ones, by forcing them into
 * new tabs that can't be resized as well.
 */
defaultPref(\"dom.disable_window_move_resize\", true);
defaultPref(\"browser.link.open_newwindow\", 3);
defaultPref(\"browser.link.open_newwindow.restriction\", 0);

/** [SECTION] MOUSE */
defaultPref(\"middlemouse.contentLoadURL\", false); // prevent mouse middle click from opening links



/** [CATEGORY] EXTENSIONS */

/** [SECTION] USER INSTALLED
 * extensions are allowed to operate on restricted domains, while their scope
 * is set to profile+applications (https://mike.kaply.com/2012/02/21/understanding-add-on-scopes/).
 * an installation prompt should always be displayed.
 */
defaultPref(\"extensions.webextensions.restrictedDomains\", \"\");
defaultPref(\"extensions.enabledScopes\", 5); // hidden
defaultPref(\"extensions.postDownloadThirdPartyPrompt\", false);

/** [SECTION] SYSTEM
 * built-in extension are not allowed to auto-update. additionally the reporter extension
 * of webcompat is disabled. urls are stripped for defense in depth.
 */
defaultPref(\"extensions.systemAddon.update.enabled\", false);
defaultPref(\"extensions.systemAddon.update.url\", \"\");
lockPref(\"extensions.webcompat-reporter.enabled\", false);
lockPref(\"extensions.webcompat-reporter.newIssueEndpoint\", \"\");

/** [SECTION] EXTENSION FIREWALL
 * the firewall can be enabled with the below prefs, but it is not a sane default:
 * defaultPref(\"extensions.webextensions.base-content-security-policy\", \"default-src 'none'; script-src 'none'; object-src 'none';\");
 * defaultPref(\"extensions.webextensions.base-content-security-policy.v3\", \"default-src 'none'; script-src 'none'; object-src 'none';\");
 */



/** [CATEGORY] BUILT-IN FEATURES */

/** [SECTION] UPDATER
 * since we do not bake auto-updates in the browser it doesn't make sense at the moment.
 */
lockPref(\"app.update.auto\", false);

/** [SECTION] SYNC
 * this functionality is disabled by default but it can be activated in one click.
 * this pref fully controls the feature, including its ui.
 */
defaultPref(\"identity.fxaccounts.enabled\", false);

/** [SECTION] LOCKWISE
 * disable the default password manager built into the browser, including its autofill
 * capabilities and formless login capture.
 */
defaultPref(\"signon.rememberSignons\", false);
defaultPref(\"signon.autofillForms\", false);
defaultPref(\"extensions.formautofill.addresses.enabled\", false);
defaultPref(\"extensions.formautofill.creditCards.enabled\", false);
defaultPref(\"signon.formlessCapture.enabled\", false);

/** [SECTION] CONTAINERS
 * enable containers and show the settings to control them in the stock ui
 */
defaultPref(\"privacy.userContext.enabled\", true);
defaultPref(\"privacy.userContext.ui.enabled\", true);

/** [SECTION] DEVTOOLS
 * disable remote debugging.
 */
pref(\"devtools.debugger.remote-enabled\", false); // default, but subject to branding so keep it
defaultPref(\"devtools.selfxss.count\", 0); // required for devtools console to work

/** [SECTION] OTHERS */
pref(\"browser.translation.engine\", \"\"); // remove translation engine
pref(\"webchannel.allowObject.urlWhitelist\", \"\"); // remove web channel whitelist
defaultPref(\"services.settings.server\", \"https://%.invalid\") // set the remote settings URL (REMOTE_SETTINGS_SERVER_URL in the code)



/** [CATEGORY] UI */

/** [SECTION] BRANDING
 * set librewolf support and releases urls in the UI, so that users land in the proper places.
 */
defaultPref(\"app.support.baseURL\", \"https://librewolf.net/docs/faq/#\");
defaultPref(\"browser.search.searchEnginesURL\", \"https://librewolf.net/docs/faq/#how-do-i-add-a-search-engine\");
defaultPref(\"browser.geolocation.warning.infoURL\", \"https://librewolf.net/docs/faq/#how-do-i-enable-location-aware-browsing\");
defaultPref(\"app.feedback.baseURL\", \"https://librewolf.net/#questions\");
defaultPref(\"app.releaseNotesURL\", \"https://gitlab.com/librewolf-community/browser\");
defaultPref(\"app.releaseNotesURL.aboutDialog\", \"https://gitlab.com/librewolf-community/browser\");
defaultPref(\"app.update.url.details\", \"https://gitlab.com/librewolf-community/browser\");
defaultPref(\"app.update.url.manual\", \"https://gitlab.com/librewolf-community/browser\");

/** [SECTION] FIRST LAUNCH
 * disable what's new and ui tour on first start and updates. the browser
 * should also not stress user about being the default one.
 */
defaultPref(\"browser.startup.homepage_override.mstone\", \"ignore\");
defaultPref(\"startup.homepage_override_url\", \"about:blank\");
defaultPref(\"startup.homepage_welcome_url\", \"http://127.0.0.1:7657\");
defaultPref(\"startup.homepage_welcome_url.additional\", \"\");
lockPref(\"browser.messaging-system.whatsNewPanel.enabled\", false);
lockPref(\"browser.uitour.enabled\", false);
lockPref(\"browser.uitour.url\", \"\");
defaultPref(\"browser.shell.checkDefaultBrowser\", false);

/** [SECTION] NEW TAB PAGE
 * we want NTP to display nothing but the search bar without anything distracting.
 * the three prefs below are just for minimalism and they should be easy to revert for users.
 */
defaultPref(\"browser.newtabpage.activity-stream.section.highlights.includeDownloads\", false);
defaultPref(\"browser.newtabpage.activity-stream.section.highlights.includeVisited\", false);
defaultPref(\"browser.newtabpage.activity-stream.feeds.topsites\", false);
// hide stories and sponsored content from Firefox Home
lockPref(\"browser.newtabpage.activity-stream.feeds.section.topstories\", false);
lockPref(\"browser.newtabpage.activity-stream.showSponsored\", false);
lockPref(\"browser.newtabpage.activity-stream.showSponsoredTopSites\", false);
// disable telemetry in Firefox Home
lockPref(\"browser.newtabpage.activity-stream.feeds.telemetry\", false);
lockPref(\"browser.newtabpage.activity-stream.telemetry\", false);
// hide stories UI in about:preferences#home, empty highlights list
lockPref(\"browser.newtabpage.activity-stream.feeds.section.topstories.options\", \"{\\"hidden\\":true}\");
lockPref(\"browser.newtabpage.activity-stream.default.sites\", \"\");

/** [SECTION] ABOUT
 * remove annoying ui elements from the about pages, including about:protections
 */
defaultPref(\"browser.contentblocking.report.lockwise.enabled\", false);
defaultPref(\"browser.contentblocking.report.monitor.enabled\", false);
lockPref(\"browser.contentblocking.report.hide_vpn_banner\", true);
lockPref(\"browser.contentblocking.report.vpn.enabled\", false);
lockPref(\"browser.contentblocking.report.show_mobile_app\", false);
lockPref(\"browser.vpn_promo.enabled\", false);
lockPref(\"browser.promo.focus.enabled\", false);
// ...about:addons recommendations sections and more
defaultPref(\"extensions.htmlaboutaddons.recommendations.enabled\", false);
defaultPref(\"extensions.getAddons.showPane\", false);
defaultPref(\"extensions.getAddons.cache.enabled\", false); // disable fetching of extension metadata
defaultPref(\"lightweightThemes.getMoreURL\", \"\"); // disable button to get more themes
// ...about:preferences#home
defaultPref(\"browser.topsites.useRemoteSetting\", false); // hide sponsored shortcuts button
// ...and about:config
defaultPref(\"browser.aboutConfig.showWarning\", false);
// hide about:preferences#moreFromMozilla
defaultPref(\"browser.preferences.moreFromMozilla\", false);

/** [SECTION] RECOMMENDED
 * disable all \"recommend as you browse\" activity.
 */
lockPref(\"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features\", false);
lockPref(\"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons\", false);



/** [CATEGORY] TELEMETRY
 * telemetry is already disabled elsewhere and most of the stuff in here is just for redundancy.
 */
lockPref(\"toolkit.telemetry.unified\", false); // master switch
lockPref(\"toolkit.telemetry.enabled\", false);  // master switch
lockPref(\"toolkit.telemetry.server\", \"data:,\");
lockPref(\"toolkit.telemetry.archive.enabled\", false);
lockPref(\"toolkit.telemetry.newProfilePing.enabled\", false);
lockPref(\"toolkit.telemetry.updatePing.enabled\", false);
lockPref(\"toolkit.telemetry.firstShutdownPing.enabled\", false);
lockPref(\"toolkit.telemetry.shutdownPingSender.enabled\", false);
lockPref(\"toolkit.telemetry.bhrPing.enabled\", false);
lockPref(\"toolkit.telemetry.cachedClientID\", \"\");
lockPref(\"toolkit.telemetry.previousBuildID\", \"\");
lockPref(\"toolkit.telemetry.server_owner\", \"\");
lockPref(\"toolkit.coverage.opt-out\", true); // hidden
lockPref(\"toolkit.telemetry.coverage.opt-out\", true); // hidden
lockPref(\"toolkit.coverage.enabled\", false);
lockPref(\"toolkit.coverage.endpoint.base\", \"\");
lockPref(\"toolkit.crashreporter.infoURL\", \"\");
lockPref(\"datareporting.healthreport.uploadEnabled\", false);
lockPref(\"datareporting.policy.dataSubmissionEnabled\", false);
lockPref(\"security.protectionspopup.recordEventTelemetry\", false);
lockPref(\"browser.ping-centre.telemetry\", false);
// opt-out of normandy and studies
lockPref(\"app.normandy.enabled\", false);
lockPref(\"app.normandy.api_url\", \"\");
lockPref(\"app.shield.optoutstudies.enabled\", false);
// disable personalized extension recommendations
lockPref(\"browser.discovery.enabled\", false);
lockPref(\"browser.discovery.containers.enabled\", false);
lockPref(\"browser.discovery.sites\", \"\");
// disable crash report
lockPref(\"browser.tabs.crashReporting.sendReport\", false);
lockPref(\"breakpad.reportURL\", \"\");
// disable connectivity checks
pref(\"network.connectivity-service.enabled\", false);
// disable captive portal
pref(\"network.captive-portal-service.enabled\", false);
pref(\"captivedetect.canonicalURL\", \"\");

/** [CATEGORY] WINDOWS
 * the prefs in this section only apply to windows installations and they don't have any
 * effect on linux, macos and bsd users.
 */

/** [SECTION] UPDATES
 * disable windows specific update services.
 */
lockPref(\"app.update.service.enabled\", false);
defaultPref(\"app.update.background.scheduling.enabled\", false);

/** [SECTION] OTHERS */
lockPref(\"default-browser-agent.enabled\", false); // disable windows specific telemetry
defaultPref(\"network.protocol-handler.external.ms-windows-store\", false); // prevent links from launching windows store
pref(\"toolkit.winRegisterApplicationRestart\", false); // disable automatic start and session restore after reboot
lockPref(\"security.family_safety.mode\", 0); // disable win8.1 family safety cert



/** [CATEGORY] OVERRIDES
 * allow settings to be overriden with a file placed in the right location
 * https://librewolf.net/docs/settings/#where-do-i-find-my-librewolfoverridescfg
 */
let profile_directory;
if (profile_directory = getenv('USERPROFILE') || getenv('HOME')) {
  defaultPref('autoadmin.global_config_url', `file://${profile_directory}/.librewolf/librewolf.overrides.cfg`);
}" | tee /home/user/Documents/librewolf.cfg > /dev/null
clear

printf 'Do you want a customized and hardened LibreFox config file? You can always customize the browser yourself later. (y/n): \n'
while :; do
	read -r librefox
	case "$librefox" in
		y )
			chown user:user /home/user/Documents/librewolf.cfg;
			chmod +x /home/user/Documents/librewolf.cfg;
			mv /usr/share/librewolf/librewolf.cfg /usr/share/librewolf/backupconfig.cfg && 
			mv /home/user/Documents/librewolf.cfg /usr/share/librewolf/librewolf.cfg;
			break
			;;
		n )
			printf 'Not a problem!\n '
			rm -rf /home/user/Documents/librewolf.cfg  
			break
			;;
		* )
			printf 'Try Again\n '
	esac
done

clear

printf 'Congratulations!\nYou have just successfully:\n*installed I2P and LibreWolf\n*Generated the custom config files(if selected)\n*Updated/Upgraded your template\n\nYou are ready to go!\nSafely shutdown and build an AppVM (:\n '
sleep 5
