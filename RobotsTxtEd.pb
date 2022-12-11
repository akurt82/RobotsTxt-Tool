CompilerSelect #PB_Compiler_OS
  CompilerCase #PB_OS_MacOS

    Procedure.s getSysLang()
      CurrentLocale = CocoaMessage(0, 0, "NSLocale currentLocale")
      LanguageCode = CocoaMessage(0, CurrentLocale, "objectForKey:$", @"kCFLocaleLanguageCodeKey")
      CocoaMessage(@LanguageCode, LanguageCode, "UTF8String")
      ProcedureReturn PeekS(LanguageCode, -1, #PB_UTF8); Show the language code
    EndProcedure

  CompilerCase #PB_OS_Linux
  CompilerCase #PB_OS_Windows
CompilerEndSelect

Global setTag.i, labDlg.s = "Add", labTit.s = "", labMes.s = "", labDel.s = "Delete"

labTit = "Enter a File or Path:"

Global stopIt.a = 0

Procedure.s pick( index.l, char.s, value.s )
  Define n.l, s.s, idx.l = 0
  ; ***
  For n = 1 To Len( value )
    Select Mid( value, n, 1 )
      Case char
        If idx = index
          Break
        Else
          idx + 1
          ; ***
          s = ""
        EndIf
      Default
        s + Mid( value, n, 1 )
    EndSelect
  Next
  ; ***
  If idx > index
    s = ""
  EndIf
  ; ***
  If index < 0
    s = ""
  EndIf
  ; ***
  If index > CountString( value, char )
    s = ""
  EndIf
  ; ***
  ProcedureReturn s
EndProcedure

Procedure enterDlg()
  DisableWindow( 0, 1 )
  OpenWindow( 1, 0, 0, 400, 90, labDlg, #PB_Window_SystemMenu | #PB_Window_WindowCentered, WindowID(0) )
  TextGadget( 200, 10, 10, 380, 30, labTit )
  StringGadget( 201, 10, 50, 380, 30, "" )
  SetActiveGadget( 201 )
  AddKeyboardShortcut( 1, #PB_Shortcut_Return, 1000 )
  AddKeyboardShortcut( 1, #PB_Shortcut_Escape, 1001 )
EndProcedure

OpenWindow( 0, 0,0, 560, 630, "5M-Ware Robots.txt Editor", #PB_Window_SystemMenu | 
                                                           #PB_Window_MinimizeGadget |
                                                           #PB_Window_ScreenCentered )
AddKeyboardShortcut( 0, #PB_Shortcut_Escape, 1002 )

TextGadget( 10, 10, 10, 100, 30, "User-Agent:" )
ListIconGadget( 100, 210, 10, 280, 140, "Crawler", 250, #PB_ListIcon_CheckBoxes | #PB_ListIcon_FullRowSelect )
CheckBoxGadget( 101, 10, 30, 200, 30, "Select all" )
; ***
ComboBoxGadget( 112, WindowWidth(0) - 60, 10, 50, 30 )
AddGadgetItem( 112, -1, "EN" )
AddGadgetItem( 112, -1, "TR" )
AddGadgetItem( 112, -1, "DE" )
AddGadgetItem( 112, -1, "NL" )
AddGadgetItem( 112, -1, "FR" )
AddGadgetItem( 112, -1, "ES" )
AddGadgetItem( 112, -1, "IT" )
AddGadgetItem( 112, -1, "RU" )
SetGadgetState( 112, 0 )
; ***
ButtonGadget( 106, GadgetX(112), GadgetY(112) + GadgetHeight(112) + 10, 50, 40, "?" )
ButtonGadget( 115, GadgetX(106), GadgetY(106) + GadgetHeight(106) + 10, 50, 40, "+" )
; ***
; http://www.robotstxt.org/db.html
AddGadgetItem( 100, -1, "ABCdatos BotLink" )
AddGadgetItem( 100, -1, "Acme.Spider" )
AddGadgetItem( 100, -1, "Ahoy! The Homepage Finder" )
AddGadgetItem( 100, -1, "Alkaline" )
AddGadgetItem( 100, -1, "Anthill" )
AddGadgetItem( 100, -1, "Walhello appie" )
AddGadgetItem( 100, -1, "Arachnophilia" )
AddGadgetItem( 100, -1, "Arale" )
AddGadgetItem( 100, -1, "Araneo" )
AddGadgetItem( 100, -1, "AraybOt" )
AddGadgetItem( 100, -1, "ArchitextSpider" )
AddGadgetItem( 100, -1, "Aretha" )
AddGadgetItem( 100, -1, "ARIADNE" )
AddGadgetItem( 100, -1, "arks" )
AddGadgetItem( 100, -1, "AskJeeves" )
AddGadgetItem( 100, -1, "ASpider (Associative Spider)" )
AddGadgetItem( 100, -1, "ATN Worldwide" )
AddGadgetItem( 100, -1, "Atomz.com Search Robot" )
AddGadgetItem( 100, -1, "AURESYS" )
AddGadgetItem( 100, -1, "BackRub" )
AddGadgetItem( 100, -1, "Bay Spider" )
AddGadgetItem( 100, -1, "Big Brother" )
AddGadgetItem( 100, -1, "Bjaaland" )
AddGadgetItem( 100, -1, "BlackWidow" )
AddGadgetItem( 100, -1, "Die Blinde Kuh" )
AddGadgetItem( 100, -1, "Bloodhound" )
AddGadgetItem( 100, -1, "Borg-Bot" )
AddGadgetItem( 100, -1, "BoxSeaBot" )
AddGadgetItem( 100, -1, "bright.net caching robot" )
AddGadgetItem( 100, -1, "BSpider" )
AddGadgetItem( 100, -1, "CACTVS Chemistry Spider" )
AddGadgetItem( 100, -1, "Calif" )
AddGadgetItem( 100, -1, "Cassandra" )
AddGadgetItem( 100, -1, "Digimarc Marcspider/CGI" )
AddGadgetItem( 100, -1, "Checkbot" )
AddGadgetItem( 100, -1, "ChristCrawler.com" )
AddGadgetItem( 100, -1, "churl" )
AddGadgetItem( 100, -1, "cIeNcIaFiCcIoN.nEt" )
AddGadgetItem( 100, -1, "CMC/0.01" )
AddGadgetItem( 100, -1, "Collective" )
AddGadgetItem( 100, -1, "Combine System" )
AddGadgetItem( 100, -1, "Conceptbot" )
AddGadgetItem( 100, -1, "ConfuzzledBot" )
AddGadgetItem( 100, -1, "CoolBot" )
AddGadgetItem( 100, -1, "Web Core / Roots" )
AddGadgetItem( 100, -1, "XYLEME Robot" )
AddGadgetItem( 100, -1, "Internet Cruiser Robot" )
AddGadgetItem( 100, -1, "Cusco" )
AddGadgetItem( 100, -1, "CyberSpyder Link Test" )
AddGadgetItem( 100, -1, "CydralSpider" )
AddGadgetItem( 100, -1, "Desert Realm Spider" )
AddGadgetItem( 100, -1, "DeWeb(c) Katalog/Index" )
AddGadgetItem( 100, -1, "DienstSpider" )
AddGadgetItem( 100, -1, "Digger" )
AddGadgetItem( 100, -1, "Digital Integrity Robot" )
AddGadgetItem( 100, -1, "Direct Hit Grabber" )
AddGadgetItem( 100, -1, "DNAbot" )
AddGadgetItem( 100, -1, "DownLoad Express" )
AddGadgetItem( 100, -1, "DragonBot" )
AddGadgetItem( 100, -1, "DWCP (Dridus' Web Cataloging Project)" )
AddGadgetItem( 100, -1, "e-collector" )
AddGadgetItem( 100, -1, "EbiNess" )
AddGadgetItem( 100, -1, "EIT Link Verifier Robot" )
AddGadgetItem( 100, -1, "ELFINBOT" )
AddGadgetItem( 100, -1, "Emacs-w3 Search Engine" )
AddGadgetItem( 100, -1, "ananzi" )
AddGadgetItem( 100, -1, "esculapio" )
AddGadgetItem( 100, -1, "Esther" )
AddGadgetItem( 100, -1, "Evliya Celebi" )
AddGadgetItem( 100, -1, "FastCrawler" )
AddGadgetItem( 100, -1, "Fluid Dynamics Search Engine robot" )
AddGadgetItem( 100, -1, "Felix IDE" )
AddGadgetItem( 100, -1, "Wild Ferret Web Hopper #1, #2, #3" )
AddGadgetItem( 100, -1, "FetchRover" )
AddGadgetItem( 100, -1, "fido" )
AddGadgetItem( 100, -1, "KIT-Fireball" )
AddGadgetItem( 100, -1, "Fish search" )
AddGadgetItem( 100, -1, "Fouineur" )
AddGadgetItem( 100, -1, "Robot Francoroute" )
AddGadgetItem( 100, -1, "Freecrawl" )
AddGadgetItem( 100, -1, "FunnelWeb" )
AddGadgetItem( 100, -1, "gammaSpider, FocusedCrawler" )
AddGadgetItem( 100, -1, "gazz" )
AddGadgetItem( 100, -1, "GCreep" )
AddGadgetItem( 100, -1, "GetBot" )
AddGadgetItem( 100, -1, "GetURL" )
AddGadgetItem( 100, -1, "Golem" )
AddGadgetItem( 100, -1, "Googlebot" )
AddGadgetItem( 100, -1, "Grapnel/0.01 Experiment" )
AddGadgetItem( 100, -1, "Griffon" )
AddGadgetItem( 100, -1, "Gromit" )
AddGadgetItem( 100, -1, "Northern Light Gulliver" )
AddGadgetItem( 100, -1, "Gulper Bot" )
AddGadgetItem( 100, -1, "HamBot" )
AddGadgetItem( 100, -1, "Harvest" )
AddGadgetItem( 100, -1, "havIndex" )
AddGadgetItem( 100, -1, "HI (HTML Index) Search" )
AddGadgetItem( 100, -1, "Hometown Spider Pro" )
AddGadgetItem( 100, -1, "ht://Dig" )
AddGadgetItem( 100, -1, "HTMLgobble" )
AddGadgetItem( 100, -1, "Hyper-Decontextualizer" )
AddGadgetItem( 100, -1, "iajaBot" )
AddGadgetItem( 100, -1, "IBM_Planetwide" )
AddGadgetItem( 100, -1, "Popular Iconoclast" )
AddGadgetItem( 100, -1, "Ingrid" )
AddGadgetItem( 100, -1, "Imagelock" )
AddGadgetItem( 100, -1, "IncyWincy" )
AddGadgetItem( 100, -1, "Informant" )
AddGadgetItem( 100, -1, "InfoSeek Robot 1.0" )
AddGadgetItem( 100, -1, "Infoseek Sidewinder" )
AddGadgetItem( 100, -1, "InfoSpiders" )
AddGadgetItem( 100, -1, "Inspector Web" )
AddGadgetItem( 100, -1, "IntelliAgent" )
AddGadgetItem( 100, -1, "I, Robot" )
AddGadgetItem( 100, -1, "Iron33" )
AddGadgetItem( 100, -1, "Israeli-search" )
AddGadgetItem( 100, -1, "JavaBee" )
AddGadgetItem( 100, -1, "JBot Java Web Robot" )
AddGadgetItem( 100, -1, "JCrawler" )
AddGadgetItem( 100, -1, "Jeeves" )
AddGadgetItem( 100, -1, "JoBo Java Web Robot" )
AddGadgetItem( 100, -1, "Jobot" )
AddGadgetItem( 100, -1, "JoeBot" )
AddGadgetItem( 100, -1, "The Jubii Indexing Robot" )
AddGadgetItem( 100, -1, "JumpStation" )
AddGadgetItem( 100, -1, "image.kapsi.net" )
AddGadgetItem( 100, -1, "Katipo" )
AddGadgetItem( 100, -1, "KDD-Explorer" )
AddGadgetItem( 100, -1, "Kilroy" )
AddGadgetItem( 100, -1, "KO_Yappo_Robot" )
AddGadgetItem( 100, -1, "LabelGrabber" )
AddGadgetItem( 100, -1, "larbin" )
AddGadgetItem( 100, -1, "legs" )
AddGadgetItem( 100, -1, "Link Validator" )
AddGadgetItem( 100, -1, "LinkScan" )
AddGadgetItem( 100, -1, "LinkWalker" )
AddGadgetItem( 100, -1, "Lockon" )
AddGadgetItem( 100, -1, "logo.gif Crawler" )
AddGadgetItem( 100, -1, "Lycos" )
AddGadgetItem( 100, -1, "Mac WWWWorm" )
AddGadgetItem( 100, -1, "Magpie" )
AddGadgetItem( 100, -1, "marvin/infoseek" )
AddGadgetItem( 100, -1, "Mattie" )
AddGadgetItem( 100, -1, "MediaFox" )
AddGadgetItem( 100, -1, "MerzScope" )
AddGadgetItem( 100, -1, "NEC-MeshExplorer" )
AddGadgetItem( 100, -1, "MindCrawler" )
AddGadgetItem( 100, -1, "mnoGoSearch search engine software" )
AddGadgetItem( 100, -1, "moget" )
AddGadgetItem( 100, -1, "MOMspider" )
AddGadgetItem( 100, -1, "Monster" )
AddGadgetItem( 100, -1, "Motor" )
AddGadgetItem( 100, -1, "MSNBot" )
AddGadgetItem( 100, -1, "Muncher" )
AddGadgetItem( 100, -1, "Muninn" )
AddGadgetItem( 100, -1, "Muscat Ferret" )
AddGadgetItem( 100, -1, "Mwd.Search" )
AddGadgetItem( 100, -1, "Internet Shinchakubin" )
AddGadgetItem( 100, -1, "NDSpider" )
AddGadgetItem( 100, -1, "Nederland.zoek" )
AddGadgetItem( 100, -1, "NetCarta WebMap Engine" )
AddGadgetItem( 100, -1, "NetMechanic" )
AddGadgetItem( 100, -1, "NetScoop" )
AddGadgetItem( 100, -1, "newscan-online" )
AddGadgetItem( 100, -1, "NHSE Web Forager" )
AddGadgetItem( 100, -1, "Nomad" )
AddGadgetItem( 100, -1, "The NorthStar Robot" )
AddGadgetItem( 100, -1, "nzexplorer" )
AddGadgetItem( 100, -1, "ObjectsSearch" )
AddGadgetItem( 100, -1, "Occam" )
AddGadgetItem( 100, -1, "HKU WWW Octopus" )
AddGadgetItem( 100, -1, "OntoSpider" )
AddGadgetItem( 100, -1, "Openfind Data gatherer" )
AddGadgetItem( 100, -1, "Orb Search" )
AddGadgetItem( 100, -1, "Pack Rat" )
AddGadgetItem( 100, -1, "PageBoy" )
AddGadgetItem( 100, -1, "ParaSite" )
AddGadgetItem( 100, -1, "Patric" )
AddGadgetItem( 100, -1, "pegasus" )
AddGadgetItem( 100, -1, "The Peregrinator" )
AddGadgetItem( 100, -1, "PerlCrawler 1.0" )
AddGadgetItem( 100, -1, "Phantom" )
AddGadgetItem( 100, -1, "PhpDig" )
AddGadgetItem( 100, -1, "PiltdownMan" )
AddGadgetItem( 100, -1, "Pimptrain.com's robot" )
AddGadgetItem( 100, -1, "Pioneer" )
AddGadgetItem( 100, -1, "html_analyzer" )
AddGadgetItem( 100, -1, "Portal Juice Spider" )
AddGadgetItem( 100, -1, "PGP Key Agent" )
AddGadgetItem( 100, -1, "PlumtreeWebAccessor" )
AddGadgetItem( 100, -1, "Poppi" )
AddGadgetItem( 100, -1, "PortalB Spider" )
AddGadgetItem( 100, -1, "psbot" )
AddGadgetItem( 100, -1, "GetterroboPlus Puu" )
AddGadgetItem( 100, -1, "The Python Robot" )
AddGadgetItem( 100, -1, "Raven Search" )
AddGadgetItem( 100, -1, "RBSE Spider" )
AddGadgetItem( 100, -1, "Resume Robot" )
AddGadgetItem( 100, -1, "RoadHouse Crawling System" )
AddGadgetItem( 100, -1, "RixBot" )
AddGadgetItem( 100, -1, "Road Runner: The ImageScape Robot" )
AddGadgetItem( 100, -1, "Robbie the Robot" )
AddGadgetItem( 100, -1, "ComputingSite Robi/1.0" )
AddGadgetItem( 100, -1, "RoboCrawl Spider" )
AddGadgetItem( 100, -1, "RoboFox" )
AddGadgetItem( 100, -1, "Robozilla" )
AddGadgetItem( 100, -1, "Roverbot" )
AddGadgetItem( 100, -1, "RuLeS" )
AddGadgetItem( 100, -1, "SafetyNet Robot" )
AddGadgetItem( 100, -1, "Scooter" )
AddGadgetItem( 100, -1, "Sleek" )
AddGadgetItem( 100, -1, "Search.Aus-AU.COM" )
AddGadgetItem( 100, -1, "SearchProcess" )
AddGadgetItem( 100, -1, "Senrigan" )
AddGadgetItem( 100, -1, "SG-Scout" )
AddGadgetItem( 100, -1, "ShagSeeker" )
AddGadgetItem( 100, -1, "Shai'Hulud" )
AddGadgetItem( 100, -1, "Sift" )
AddGadgetItem( 100, -1, "Simmany Robot Ver1.0" )
AddGadgetItem( 100, -1, "Site Valet" )
AddGadgetItem( 100, -1, "Open Text Index Robot" )
AddGadgetItem( 100, -1, "SiteTech-Rover" )
AddGadgetItem( 100, -1, "Skymob.com" )
AddGadgetItem( 100, -1, "SLCrawler" )
AddGadgetItem( 100, -1, "Inktomi Slurp" )
AddGadgetItem( 100, -1, "Smart Spider" )
AddGadgetItem( 100, -1, "Snooper" )
AddGadgetItem( 100, -1, "Solbot" )
AddGadgetItem( 100, -1, "Spanner" )
AddGadgetItem( 100, -1, "Speedy Spider" )
AddGadgetItem( 100, -1, "spider_monkey" )
AddGadgetItem( 100, -1, "SpiderBot" )
AddGadgetItem( 100, -1, "Spiderline Crawler" )
AddGadgetItem( 100, -1, "SpiderMan" )
AddGadgetItem( 100, -1, "SpiderView(tm)" )
AddGadgetItem( 100, -1, "Spry Wizard Robot" )
AddGadgetItem( 100, -1, "Site Searcher" )
AddGadgetItem( 100, -1, "Suke" )
AddGadgetItem( 100, -1, "suntek search engine" )
AddGadgetItem( 100, -1, "Sven" )
AddGadgetItem( 100, -1, "Sygol" )
AddGadgetItem( 100, -1, "TACH Black Widow" )
AddGadgetItem( 100, -1, "Tarantula" )
AddGadgetItem( 100, -1, "tarspider" )
AddGadgetItem( 100, -1, "Tcl W3 Robot" )
AddGadgetItem( 100, -1, "TechBOT" )
AddGadgetItem( 100, -1, "Templeton" )
AddGadgetItem( 100, -1, "TeomaTechnologies" )
AddGadgetItem( 100, -1, "TITAN" )
AddGadgetItem( 100, -1, "TitIn" )
AddGadgetItem( 100, -1, "The TkWWW Robot" )
AddGadgetItem( 100, -1, "TLSpider" )
AddGadgetItem( 100, -1, "UCSD Crawl" )
AddGadgetItem( 100, -1, "UdmSearch" )
AddGadgetItem( 100, -1, "UptimeBot" )
AddGadgetItem( 100, -1, "URL Check" )
AddGadgetItem( 100, -1, "URL Spider Pro" )
AddGadgetItem( 100, -1, "Valkyrie" )
AddGadgetItem( 100, -1, "Verticrawl" )
AddGadgetItem( 100, -1, "Victoria" )
AddGadgetItem( 100, -1, "vision-search" )
AddGadgetItem( 100, -1, "void-bot" )
AddGadgetItem( 100, -1, "Voyager" )
AddGadgetItem( 100, -1, "VWbot" )
AddGadgetItem( 100, -1, "The NWI Robot" )
AddGadgetItem( 100, -1, "W3M2" )
AddGadgetItem( 100, -1, "WallPaper (alias crawlpaper)" )
AddGadgetItem( 100, -1, "the World Wide Web Wanderer" )
AddGadgetItem( 100, -1, "w@pSpider by wap4.com" )
AddGadgetItem( 100, -1, "WebBandit Web Spider" )
AddGadgetItem( 100, -1, "WebCatcher" )
AddGadgetItem( 100, -1, "WebCopy" )
AddGadgetItem( 100, -1, "webfetcher" )
AddGadgetItem( 100, -1, "The Webfoot Robot" )
AddGadgetItem( 100, -1, "Webinator" )
AddGadgetItem( 100, -1, "weblayers" )
AddGadgetItem( 100, -1, "WebLinker" )
AddGadgetItem( 100, -1, "WebMirror" )
AddGadgetItem( 100, -1, "The Web Moose" )
AddGadgetItem( 100, -1, "WebQuest" )
AddGadgetItem( 100, -1, "Digimarc MarcSpider" )
AddGadgetItem( 100, -1, "WebReaper" )
AddGadgetItem( 100, -1, "webs" )
AddGadgetItem( 100, -1, "Websnarf" )
AddGadgetItem( 100, -1, "WebSpider" )
AddGadgetItem( 100, -1, "WebVac" )
AddGadgetItem( 100, -1, "webwalk" )
AddGadgetItem( 100, -1, "WebWalker" )
AddGadgetItem( 100, -1, "WebWatch" )
AddGadgetItem( 100, -1, "Wget" )
AddGadgetItem( 100, -1, "whatUseek Winona" )
AddGadgetItem( 100, -1, "WhoWhere Robot" )
AddGadgetItem( 100, -1, "Wired Digital" )
AddGadgetItem( 100, -1, "Weblog Monitor" )
AddGadgetItem( 100, -1, "w3mir" )
AddGadgetItem( 100, -1, "WebStolperer" )
AddGadgetItem( 100, -1, "The Web Wombat" )
AddGadgetItem( 100, -1, "The World Wide Web Worm" )
AddGadgetItem( 100, -1, "WWWC Ver 0.2.5" )
AddGadgetItem( 100, -1, "WebZinger" )
AddGadgetItem( 100, -1, "XGET" )
SetGadgetState( 100, 0 )

OptionGadget( 102, 10, GadgetY(100) + GadgetHeight(100) + 10, 380, 24, "Forbid full access..." )
OptionGadget( 103, 10, GadgetY(102) + GadgetHeight(102) + 10, 380, 24, "Forbid the following:" )
SetGadgetState( 102, 1 )

ListViewGadget( 104, 210, GadgetY(103) + GadgetHeight(103) + 10, 280, 140 )
ButtonGadget( 105, 25, GadgetY(104), 180, 40,      "Add" )
ButtonGadget( 107, 25, GadgetY(104) + GadgetHeight(104) - 40, 180, 40, "Delete" )
DisableGadget( 104, 1 )
DisableGadget( 105, 1 )
DisableGadget( 107, 1 )

CheckBoxGadget( 108, 10, GadgetY(107) + GadgetHeight(107) + 10, 380, 24, "Using Sitemaps?" )
ListViewGadget( 109, 210, GadgetY(108) + GadgetHeight(108) + 10, 280, 100 )
ButtonGadget( 110, 25, GadgetY(109), 180, 40,      "Add" )
ButtonGadget( 111, 25, GadgetY(109) + GadgetHeight(109) - 40, 180, 40, "Delete" )
DisableGadget( 109, 1 )
DisableGadget( 110, 1 )
DisableGadget( 111, 1 )

ButtonGadget( 113, WindowWidth(0) - 110, WindowHeight(0) - 50 - 30, 100, 40, "Create" )
ButtonGadget( 114, 10, GadgetY(113), 100, 40, "Open" )
DisableGadget( 113, 1 )

If CreateStatusBar(10,WindowID(0))
  AddStatusBarField(#PB_Ignore)
EndIf

Select getSysLang()
  Case "en"
    SetGadgetText( 10, "User-Agent:" )
    SetGadgetText( 101, "Select all" )
    SetGadgetText( 102, "Forbid full access..." )
    SetGadgetText( 103, "Forbid the following:" )
    SetGadgetText( 105, "Add" )
    SetGadgetText( 110, "Add" )
    SetGadgetText( 107, "Delete" )
    SetGadgetText( 111, "Delete" )
    SetGadgetText( 108, "Using Sitemaps?" )
    SetGadgetText( 113, "Create" )
    SetGadgetText( 114, "Open" )
    SetGadgetState(112,0)
  Case "tr"
    SetGadgetText( 10, "User-Agent:" )
    SetGadgetText( 101, "Hepsini seç" )
    SetGadgetText( 102, "Tam erişim yasak..." )
    SetGadgetText( 103, "Sadece şunları yasakla:" )
    SetGadgetText( 105, "Ekle" )
    SetGadgetText( 110, "Ekle" )
    SetGadgetText( 107, "Kaldır" )
    SetGadgetText( 111, "Kaldır" )
    SetGadgetText( 108, "Site haritası eklenecek mi?" )
    SetGadgetText( 113, "Oluştur" )
    SetGadgetText( 114, "Aç" )
    SetGadgetState(112,1)
  Case "de"
    SetGadgetText( 10, "User-Agent:" )
    SetGadgetText( 101, "Alles auswählen" )
    SetGadgetText( 102, "Vollzugriff verbieten..." )
    SetGadgetText( 103, "Folgende verbieten:" )
    SetGadgetText( 105, "Hinzufügen" )
    SetGadgetText( 110, "Hinzufügen" )
    SetGadgetText( 107, "Löschen" )
    SetGadgetText( 111, "Löschen" )
    SetGadgetText( 108, "Sitemaps verwenden?" )
    SetGadgetText( 113, "Erstellen" )
    SetGadgetText( 114, "Öffnen" )
    SetGadgetState(112,2)
  Case "nl"
    SetGadgetText( 10, "User-Agent:" )
    SetGadgetText( 101, "Selecteer alles" )
    SetGadgetText( 102, "Verbied full-toegang..." )
    SetGadgetText( 103, "Verbied het volgende:" )
    SetGadgetText( 105, "Toevoegen" )
    SetGadgetText( 110, "Toevoegen" )
    SetGadgetText( 107, "Verwijderen" )
    SetGadgetText( 111, "Verwijderen" )
    SetGadgetText( 108, "Gebruik Sitemaps?" )
    SetGadgetText( 113, "Maken" )
    SetGadgetText( 114, "Open" )
    SetGadgetState(112,3)
  Case "fr"
    SetGadgetText( 10, "User-Agent:" )
    SetGadgetText( 101, "Sélectionner tout" )
    SetGadgetText( 102, "Interdisez accès complet..." )
    SetGadgetText( 103, "Interdisez le suivant:" )
    SetGadgetText( 105, "Ajouter" )
    SetGadgetText( 110, "Ajouter" )
    SetGadgetText( 107, "Effacer" )
    SetGadgetText( 111, "Effacer" )
    SetGadgetText( 108, "Utilisez Sitemaps?" )
    SetGadgetText( 113, "Créer" )
    SetGadgetText( 114, "Ouvert" )
    SetGadgetState(112,4)
  Case "es"
    SetGadgetText( 10, "User-Agent:" )
    SetGadgetText( 101, "Seleccionar todo" )
    SetGadgetText( 102, "Prohibir acceso total..." )
    SetGadgetText( 103, "Prohibir la siguiente:" )
    SetGadgetText( 105, "Añadir" )
    SetGadgetText( 110, "Añadir" )
    SetGadgetText( 107, "Borrar" )
    SetGadgetText( 111, "Borrar" )
    SetGadgetText( 108, "Utilice Sitemaps?" )
    SetGadgetText( 113, "Crear" )
    SetGadgetText( 114, "Abierto" )
    SetGadgetState(112,5)
  Case "it"
    SetGadgetText( 10, "User-Agent:" )
    SetGadgetText( 101, "Seleziona tutto" )
    SetGadgetText( 102, "Vietare pieno accesso..." )
    SetGadgetText( 103, "Vietare il seguente:" )
    SetGadgetText( 105, "Aggiungere" )
    SetGadgetText( 110, "Aggiungere" )
    SetGadgetText( 107, "Elimina" )
    SetGadgetText( 111, "Elimina" )
    SetGadgetText( 108, "Utilizzare Sitemaps?" )
    SetGadgetText( 113, "Creare" )
    SetGadgetText( 114, "Aperto" )
    SetGadgetState(112,6)
  Case "ru"
    SetGadgetText( 10, "User-Agent:" )
    SetGadgetText( 101, "Выбрать все" )
    SetGadgetText( 102, "Запретите полный доступ..." )
    SetGadgetText( 103, "Запретите следующее:" )
    SetGadgetText( 105, "Добавить" )
    SetGadgetText( 110, "Добавить" )
    SetGadgetText( 107, "Удалить" )
    SetGadgetText( 111, "Удалить" )
    SetGadgetText( 108, "Используйте Sitemaps?" )
    SetGadgetText( 113, "Создайте" )
    SetGadgetText( 114, "Открыто" )
    SetGadgetState(112,7)
EndSelect
; ***
labDlg = GetGadgetText( 105 )
labDel = GetGadgetText( 107 )

Procedure finat()
  Define u.i = 0
  ; ***
  If CountGadgetItems(104) And GetGadgetState(101)
    DisableGadget( 113, 0 )
  Else
    If CountGadgetItems(100)
      For n = 0 To CountGadgetItems(100) - 1
        If GetGadgetItemState(100,n) = 2
          u + 1
        EndIf
      Next
      ; ***
      If u And CountGadgetItems(104)
        DisableGadget( 113, 0 )
      Else
        DisableGadget( 113, 1 )
      EndIf
    Else
      DisableGadget( 113, 1 )
    EndIf
  EndIf
EndProcedure

Global e.i

Repeat
  e = WaitWindowEvent()
  ; ***
  If e = #PB_Event_CloseWindow And EventWindow() = 1
    DisableWindow( 0, 0 )
    SetActiveWindow( 0 )
    CloseWindow( 1 )
  ElseIf e = #PB_Event_Menu And EventMenu() = #PB_Menu_Quit
    Break
  ElseIf e = #PB_Event_Menu And EventMenu() = 1002
    Break
  ElseIf e = #PB_Event_Menu And EventMenu() = 1001
    DisableWindow( 0, 0 )
    SetActiveWindow( 0 )
    CloseWindow( 1 )
  ElseIf e = #PB_Event_Menu And EventMenu() = 1000
    If Trim(GetGadgetText(201))
      AddGadgetItem( setTag, -1, Trim(GetGadgetText(201)) )
      ; ***
      DisableWindow( 0, 0 )
      SetActiveWindow( 0 )
      CloseWindow( 1 )
      ; ***
      finat()
    EndIf
  ElseIf e = #PB_Event_Gadget
    Select EventGadget()
      Case 100
        Select EventType()
          Case #PB_EventType_LeftClick, #PB_EventType_Change
            finat()
            ; ***
            StatusBarText( 10, 0, "Crawler: " + GetGadgetText(100) )
        EndSelect
      Case 104
        Select EventType()
          Case #PB_EventType_LeftClick, #PB_EventType_RightClick, #PB_EventType_Change
            If CountGadgetItems(104) = 0
              DisableGadget( 107, 1 )
            Else
              DisableGadget( 107, 0 )
            EndIf
            finat()
            StatusBarText( 10, 0, "Disallow: " + GetGadgetText(104) )
        EndSelect
      Case 109
        Select EventType()
          Case #PB_EventType_LeftClick, #PB_EventType_RightClick, #PB_EventType_Change
            If CountGadgetItems(109) = 0
              DisableGadget( 111, 1 )
            Else
              DisableGadget( 111, 0 )
            EndIf
            finat()
            StatusBarText( 10, 0, "Sitemap: " + GetGadgetText(109) )
        EndSelect
      Case 101
        For n = 0 To CountGadgetItems(100) - 1
          Select GetGadgetState(101)
            Case 1 : SetGadgetItemState( 100, n, 2 )
            Case 0 : SetGadgetItemState( 100, n, 0 )
          EndSelect
        Next
        ; ***
        finat()
      Case 102
        DisableGadget( 104, 1 )
        DisableGadget( 105, 1 )
        DisableGadget( 107, 1 )
      Case 103
        DisableGadget( 104, 0 )
        DisableGadget( 105, 0 )
        DisableGadget( 107, 0 )
        ; ***
        If CountGadgetItems(104) = 0
          DisableGadget( 107, 1 )
        EndIf
      Case 108
        Select GetGadgetState(108)
          Case 0
            DisableGadget( 109, 1 )
            DisableGadget( 110, 1 )
            DisableGadget( 111, 1 )
          Case 1
            DisableGadget( 109, 0 )
            DisableGadget( 110, 0 )
            DisableGadget( 111, 0 )
            ; ***
            If CountGadgetItems(109) = 0
              DisableGadget( 111, 1 )
            EndIf
        EndSelect
      Case 112
        Select GetGadgetState(112)
          Case 0 ; EN
            SetGadgetText( 10, "User-Agent:" )
            SetGadgetText( 101, "Select all" )
            SetGadgetText( 102, "Forbid full access..." )
            SetGadgetText( 103, "Forbid the following:" )
            SetGadgetText( 105, "Add" )
            SetGadgetText( 110, "Add" )
            SetGadgetText( 107, "Delete" )
            SetGadgetText( 111, "Delete" )
            SetGadgetText( 108, "Using Sitemaps?" )
            SetGadgetText( 113, "Create" )
            SetGadgetText( 114, "Open" )
          Case 1 ; TR
            SetGadgetText( 10, "User-Agent:" )
            SetGadgetText( 101, "Hepsini seç" )
            SetGadgetText( 102, "Tam erişim yasak..." )
            SetGadgetText( 103, "Sadece şunları yasakla:" )
            SetGadgetText( 105, "Ekle" )
            SetGadgetText( 110, "Ekle" )
            SetGadgetText( 107, "Kaldır" )
            SetGadgetText( 111, "Kaldır" )
            SetGadgetText( 108, "Site haritası eklenecek mi?" )
            SetGadgetText( 113, "Oluştur" )
            SetGadgetText( 114, "Aç" )
          Case 2 ; DE
            SetGadgetText( 10, "User-Agent:" )
            SetGadgetText( 101, "Alles auswählen" )
            SetGadgetText( 102, "Vollzugriff verbieten..." )
            SetGadgetText( 103, "Folgende verbieten:" )
            SetGadgetText( 105, "Hinzufügen" )
            SetGadgetText( 110, "Hinzufügen" )
            SetGadgetText( 107, "Löschen" )
            SetGadgetText( 111, "Löschen" )
            SetGadgetText( 108, "Sitemaps verwenden?" )
            SetGadgetText( 113, "Erstellen" )
            SetGadgetText( 114, "Öffnen" )
          Case 3 ; NL
            SetGadgetText( 10, "User-Agent:" )
            SetGadgetText( 101, "Selecteer alles" )
            SetGadgetText( 102, "Verbied full-toegang..." )
            SetGadgetText( 103, "Verbied het volgende:" )
            SetGadgetText( 105, "Toevoegen" )
            SetGadgetText( 110, "Toevoegen" )
            SetGadgetText( 107, "Verwijderen" )
            SetGadgetText( 111, "Verwijderen" )
            SetGadgetText( 108, "Gebruik Sitemaps?" )
            SetGadgetText( 113, "Maken" )
            SetGadgetText( 114, "Open" )
          Case 4 ; FR
            SetGadgetText( 10, "User-Agent:" )
            SetGadgetText( 101, "Sélectionner tout" )
            SetGadgetText( 102, "Interdisez accès complet..." )
            SetGadgetText( 103, "Interdisez le suivant:" )
            SetGadgetText( 105, "Ajouter" )
            SetGadgetText( 110, "Ajouter" )
            SetGadgetText( 107, "Effacer" )
            SetGadgetText( 111, "Effacer" )
            SetGadgetText( 108, "Utilisez Sitemaps?" )
            SetGadgetText( 113, "Créer" )
            SetGadgetText( 114, "Ouvert" )
          Case 5 ; ES
            SetGadgetText( 10, "User-Agent:" )
            SetGadgetText( 101, "Seleccionar todo" )
            SetGadgetText( 102, "Prohibir acceso total..." )
            SetGadgetText( 103, "Prohibir la siguiente:" )
            SetGadgetText( 105, "Añadir" )
            SetGadgetText( 110, "Añadir" )
            SetGadgetText( 107, "Borrar" )
            SetGadgetText( 111, "Borrar" )
            SetGadgetText( 108, "Utilice Sitemaps?" )
            SetGadgetText( 113, "Crear" )
            SetGadgetText( 114, "Abierto" )
          Case 6 ; IT
            SetGadgetText( 10, "User-Agent:" )
            SetGadgetText( 101, "Seleziona tutto" )
            SetGadgetText( 102, "Vietare pieno accesso..." )
            SetGadgetText( 103, "Vietare il seguente:" )
            SetGadgetText( 105, "Aggiungere" )
            SetGadgetText( 110, "Aggiungere" )
            SetGadgetText( 107, "Elimina" )
            SetGadgetText( 111, "Elimina" )
            SetGadgetText( 108, "Utilizzare Sitemaps?" )
            SetGadgetText( 113, "Creare" )
            SetGadgetText( 114, "Aperto" )
          Case 7 ; RU
            SetGadgetText( 10, "User-Agent:" )
            SetGadgetText( 101, "Выбрать все" )
            SetGadgetText( 102, "Запретите полный доступ..." )
            SetGadgetText( 103, "Запретите следующее:" )
            SetGadgetText( 105, "Добавить" )
            SetGadgetText( 110, "Добавить" )
            SetGadgetText( 107, "Удалить" )
            SetGadgetText( 111, "Удалить" )
            SetGadgetText( 108, "Используйте Sitemaps?" )
            SetGadgetText( 113, "Создайте" )
            SetGadgetText( 114, "Открыто" )
        EndSelect
        ; ***
        labDlg = GetGadgetText( 105 )
        labDel = GetGadgetText( 107 )
      Case 105 ; Add Disallow
        Select GetGadgetState(112)
          Case 0 : labTit = "Enter a File or Path:"
          Case 1 : labTit = "Dosya veya İm gir:"
          Case 2 : labTit = "Eine Datei oder ein Pfad angeben:"
          Case 3 : labTit = "Voer een bestand of pad:"
          Case 4 : labTit = "Entrez un fichier ou de chemin:"
          Case 5 : labTit = "Introduzca un archivo o ruta:"
          Case 6 : labTit = "Inserire un file o percorso:"
          Case 7 : labTit = "Введите файла или путь:"
        EndSelect
        ; ***
        setTag = 104
        enterDlg()
      Case 110 ; Add Sitemap
        Select GetGadgetState(112)
          Case 0 : labTit = "Enter a Sitemap-Path:"
          Case 1 : labTit = "Site haritası gir:"
          Case 2 : labTit = "Sitemap angeben:"
          Case 3 : labTit = "Voer een sitemap:"
          Case 4 : labTit = "Entrez un plan Sitemap:"
          Case 5 : labTit = "Introduzca un mapa del sitio:"
          Case 6 : labTit = "Inserire una Sitemap:"
          Case 7 : labTit = "Введите Sitemap:"
        EndSelect
        ; ***
        setTag = 109
        enterDlg()
      Case 113 ; Save
        pth$ = SaveFileRequester( "Robots.txt", "robots.txt", "TXT|*.txt", 0 )
        ; ***
        If FileSize( pth$ ) >= 0
          pth$ = "Robots_" + FormatDate("%dd_%mm_%yyyy",Date()) + "_" +
                 FormatDate("%hh_%ii_%ss",Date()) + ".txt"
          ; ***
          Select GetGadgetState(112)
            Case 0 : labMes = "The new file is created under the name: "
            Case 1 : labMes = "Yeni dosya belirtilen isim olarak kaydedildi: "
            Case 2 : labMes = "Die Datei wurde unter dem folgenden Namen erzeugt: "
            Case 3 : labMes = "Het nieuwe bestand wordt gemaakt onder de naam: "
            Case 4 : labMes = "Le nouveau fichier est créé sous le nom de: "
            Case 5 : labMes = "El nuevo archivo se crea con el nombre: "
            Case 6 : labMes = "Il nuovo file viene creato con il nome: "
            Case 7 : labMes = "Создается новый файл под именем: "
          EndSelect
          ; ***
          MessageRequester( "Robots.txt Editor", labMes )
        EndIf
        ; ***
        If CreateFile( 10, pth$ )
          ; ***
          For p = 0 To CountGadgetItems(109) - 1
            WriteStringN( 10, "Sitemap: " + GetGadgetItemText(109,p) )
          Next
          ; ***
          WriteStringN( 10, "" )
          ; ***
          Select GetGadgetState(101)
            Case 0 : 
              For p = 0 To CountGadgetItems(100) - 1
                If GetGadgetItemState(100,p) = 2
                  WriteStringN( 10, "User-agent: " + GetGadgetItemText(100,p) )
                EndIf
              Next
            Case 1 : WriteStringN( 10, "User-agent: *" )
          EndSelect
          ; ***
          WriteStringN( 10, "" )
          ; ***
          For p = 0 To CountGadgetItems(104) - 1
            WriteStringN( 10, "Disallow: " + GetGadgetItemText(104,p) )
          Next
          ; ***
          CloseFile(10)
        EndIf
      Case 114 ; Open
        pth$ = OpenFileRequester( "Robots.txt", "robots.txt", "TXT|*.txt", 0 )
        ; ***
        If FileSize( pth$ ) > 0
          For n = 0 To CountGadgetItems(100) - 1
            SetGadgetItemState( 100, n, 0 )
          Next
          ; ***
          ClearGadgetItems(104)
          ClearGadgetItems(109)
          ; ***
          DisableGadget( 104, 1 )
          DisableGadget( 105, 1 )
          DisableGadget( 107, 1 )
          ; ***
          DisableGadget( 109, 1 )
          DisableGadget( 110, 1 )
          DisableGadget( 111, 1 )
          ; ***
          DisableGadget( 113, 1 )
          ; ***
          SetGadgetState( 102, 0 )
          SetGadgetState( 103, 1 )
          ; ***
          If ReadFile( 20, pth$ )
            While Eof(20) = 0
              ln$ = ReadString(20)
              ; ***
              ln$ = ReplaceString( ln$, Chr(9), " " )
              ln$ = Trim(ln$)
              ; ***
              Select Trim(LCase(pick( 0, ":", ln$ )))
                Case "user-agent"
                  Select Trim(LCase(pick( 1, ":", ln$ )))
                    Case "*"
                      For n = 0 To CountGadgetItems(100) - 1
                        SetGadgetItemState( 100, n, 2 )
                      Next
                      ; ***
                      SetGadgetState( 101, 1 )
                    Default
                      For n = 0 To CountGadgetItems(100) - 1
                        If Trim(LCase(pick( 1, ":", ln$ ))) = LCase(GetGadgetItemText(100,n))
                          SetGadgetItemState( 100, n, 2 )
                          ; ***
                          Break
                        EndIf
                      Next
                  EndSelect
                Case "sitemap"
                  ln$ = Trim(ln$)
                  ln$ = Mid( ln$, Len("sitemap: ") )
                  ln$ = Trim(ln$)
                  ; ***
                  AddGadgetItem( 109, -1, ln$ )
                  ; ***
                  DisableGadget( 109, 0 )
                  DisableGadget( 110, 0 )
                  DisableGadget( 111, 0 )
                  ; ***
                  SetGadgetState( 108, 1 )
                Case "disallow"
                  ln$ = Trim(ln$)
                  ln$ = Mid( ln$, Len("disallow: ") )
                  ln$ = Trim(ln$)
                  ; ***
                  AddGadgetItem( 104, -1, ln$ )
                  ; ***
                  DisableGadget( 104, 0 )
                  DisableGadget( 105, 0 )
                  DisableGadget( 107, 0 )
              EndSelect
            Wend
            ; ***
            CloseFile(20)
          EndIf
        EndIf
      Case 107 ; Delete Disallow
        If MessageRequester( "Robots.txt Editor", labDel + "?", #PB_MessageRequester_YesNo ) = #PB_MessageRequester_Yes
          RemoveGadgetItem( 104, GetGadgetState(104) )
          finat()
          If CountGadgetItems(104) = 0
            DisableGadget( 107, 1 )
          Else
            DisableGadget( 107, 0 )
          EndIf
        EndIf
      Case 111 ; Delete Sitemap
        If MessageRequester( "Robots.txt Editor", labDel + "?", #PB_MessageRequester_YesNo ) = #PB_MessageRequester_Yes
          RemoveGadgetItem( 109, GetGadgetState(109) )
          finat()
          If CountGadgetItems(109) = 0
            DisableGadget( 111, 1 )
          Else
            DisableGadget( 111, 0 )
          EndIf
        EndIf
      Case 106
        MessageRequester( "Robots.txt Editor",
                          "Programmed and designed by" + #CRLF$ +
                          "Abdülaziz Kurt" + #CRLF$ + #CRLF$ +
                          "5M-Ware Copyright (c) 2016" + #CRLF$ + 
                          "info@5m-ware.de" + #CRLF$ + #CRLF$ +
                          "Freeware" + #CRLF$ + #CRLF$ +
                          "Application-Icon: " + #CRLF$ +
                          "Creative Commons Attribution " + #CRLF$ +
                          "Non-commercial Share Alike (by-nc-sa)" + #CRLF$ +
                          "Designer: Ahmad Hania" )
      Case 115
        RunProgram( ProgramFilename() )
    EndSelect
  EndIf
Until e = #PB_Event_CloseWindow And EventWindow() = 0

End
; IDE Options = PureBasic 5.50 (MacOS X - x86)
; CursorPosition = 564
; FirstLine = 486
; Folding = w
; EnableXP
; UseIcon = search.icns
; Executable = Robots.txt Editor.app