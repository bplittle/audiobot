# URL = './sounds.json'
# URL = 'http://www.therapboard.com'

require 'nokogiri' # gem install nokogiri
require 'open-uri' # already part of your ruby install

sounds = ["audio/2chainz_4.mp3",

"audio/2chainz_yeah2.mp3",

"audio/2chainz_tellem.mp3",

"audio/2chainz_tru.mp3",

"audio/2chainz_unh3.mp3",

"audio/2chainz_watchout.mp3",

"audio/2chainz_whistle.mp3",

"audio/2pac_4.mp3",

"audio/2pac_5.mp3",

"audio/2pac_6.mp3",

"audio/21savage_21.mp3",

"audio/50_5.mp3",

"audio/50_8.mp3",

"audio/50_11.mp3",

"audio/50cent_2.mp3",

"audio/action_bronsolino.mp3",

"audio/action_yeah.mp3",

"audio/action_yo.mp3",

"audio/actionbronson_istme.mp3",

"audio/actionbronson_unh.mp3",

"audio/akon_1.mp3",

"audio/beanie_mac.mp3",

"audio/bigboi_1.mp3",

"audio/bigl_3.mp3",

"audio/bigl_4.mp3",

"audio/bigl_5.mp3",

"audio/bigsean_boi2.mp3",

"audio/bigsean_doit.mp3",

"audio/bigsean_holdup2.mp3",

"audio/bigsean_ohgod.mp3",

"audio/bigsean_okay.mp3",

"audio/bigsean_stop.mp3",

"audio/bigsean_whoa.mp3",

"audio/bigsean_whoathere.mp3",

"audio/bigsean_unhunh.mp3",

"audio/birdman_4.mp3",

"audio/birdman_10.mp3",

"audio/birdman_16.mp3",

"audio/birdman_1.mp3",

"audio/birdman_6.mp3",

"audio/birdman_birdman.mp3",

"audio/birdman_nonsense.mp3",

"audio/birdman_respeck.mp3",

"audio/bobby_hahaha.mp3",

"audio/bowwow_yeah.mp3",

"audio/bunb_ugk4life.mp3",

"audio/busta_6.mp3",

"audio/busta_1.mp3",

"audio/busta_2.mp3",

"audio/busta_5.mp3",

"audio/camron_1.mp3",

"audio/camron_2.mp3",

"audio/chance_aghh2.mp3",

"audio/chedda_car4.mp3",

"audio/chedda_ugh.mp3",

"audio/keef_bang.mp3",

"audio/keef_catchup.mp3",

"audio/chingy_1.mp3",

"audio/currensy_1.mp3",

"audio/dabrat_comeon.mp3",

"audio/dabrat_lookout.mp3",

"audio/dabrat_oh.mp3",

"audio/danny_stop.mp3",

"audio/danny_yeah.mp3",

"audio/dannybrown_laugh2.mp3",

"audio/danny_check.mp3",

"audio/davidbanner_5.mp3",

"audio/desiigner_pandapanda.mp3",

"audio/desiigner_rahhh.mp3",

"audio/desiigner_yeha.mp3",

"audio/diddy_1.mp3",

"audio/diddy_3.mp3",

"audio/diddy_4.mp3",

"audio/diddy_5.mp3",

"audio/diddy_6.mp3",

"audio/diddy_7.mp3",

"audio/dizzee_1.mp3",

"audio/djdrama_dramatic.mp3",

"audio/djkhaled_2.mp3",

"audio/djkhaled_3.mp3",

"audio/khaled_blessup2.mp3",

"audio/khaled_majorkey3.mp3",

"audio/khaled_Riel_Life.mp3",

"audio/khaled_theydontwant.mp3",

"audio/khaled_wethebest.mp3",

"audio/khaled_youdontlovemenomo.mp3",

"audio/khaled_anotherone.mp3",

"audio/djmustard_onthebeat.mp3",

"audio/djpaul_2.mp3",

"audio/djpaul_3.mp3",

"audio/djpaul_9.mp3",

"audio/dmx_1.mp3",

"audio/dmx_3.mp3",

"audio/dmx_6.mp3",

"audio/dmx_7.mp3",

"audio/drake_2.mp3",

"audio/drake_3.mp3",

"audio/drake_4.mp3",

"audio/drake_5.mp3",

"audio/drake_goddamngoddamn.mp3",

"audio/drake_worst.mp3",

"audio/drake_yeahyuh3.mp3",

"audio/drummaboy_1.mp3",

"audio/e40_1.mp3",

"audio/e40_2.mp3",

"audio/eazye_1.mp3",

"audio/eminem_3.mp3",

"audio/eminem_4.mp3",

"audio/fatjoe_1.mp3",

"audio/fatjoe_9.mp3",

"audio/fatjoe_5.mp3",

"audio/fetty_1738.mp3",

"audio/fetty_hey2.mp3",

"audio/fetty_yeahbaby.mp3",

"audio/flava_1.mp3",

"audio/foxy_yeah.mp3",

"audio/foxy_unh2.mp3",

"audio/foxy_heyo.mp3",

"audio/freeway_1.mp3",

"audio/french_1.mp3",

"audio/french_haan.mp3",

"audio/future_brrr.mp3",

"audio/future_hendrix.mp3",

"audio/future_hey.mp3",

"audio/future_woo.mp3",

"audio/ghostface_yo.mp3",

"audio/grandmaster_1.mp3",

"audio/gucci_1.mp3",

"audio/gucci_4.mp3",

"audio/gucci_14.mp3",

"audio/gucci_8.mp3",

"audio/gucci_9.mp3",

"audio/hurricanechris_1.mp3",

"audio/icecube_1.mp3",

"audio/inspectahdeck_killahill.mp3",

"audio/jadakiss_3.mp3",

"audio/jarule_1.mp3",

"audio/jarule_2.mp3",

"audio/jayz_7.mp3",

"audio/jayz_9.mp3",

"audio/jayz_1.mp3",

"audio/jayz5.mp3",

"audio/jayz7.mp3",

"audio/jayz8.mp3",

"audio/jayz_itsthero.mp3",

"audio/jayz_itsyoboy.mp3",

"audio/jayz_jiggaman.mp3",

"audio/jayz_woo.mp3",

"audio/jayz_yessir.mp3",

"audio/jayz_young.mp3",

"audio/jazzypha_1.mp3",

"audio/jcole_bitch.mp3",

"audio/jermaine_unh.mp3",

"audio/jones_8.mp3",

"audio/jones_14.mp3",

"audio/juelz_2.mp3",

"audio/juicyj_1.mp3",

"audio/juicyj_8.mp3",

"audio/juicyj_9.mp3",

"audio/juicyj_10.mp3",

"audio/juicyj_7.mp3",

"audio/juicyj_yeahhoe.mp3",

"audio/kanebeatz_inthebuilding.mp3",

"audio/kanye_1.mp3",

"audio/kanye_ouh.mp3",

"audio/kanye_unh.mp3",

"audio/kendrick_biatch3.mp3",

"audio/kendrick_tootoo.mp3",

"audio/killermike_2.mp3",

"audio/killermike_3.mp3",

"audio/krsone_1.mp3",

"audio/lilb_1.mp3",

"audio/lilb_2.mp3",

"audio/liljon_2.mp3",

"audio/liljon_3.mp3",

"audio/liljon_8.mp3",

"audio/liljon_4.mp3",

"audio/lilkim_queenb.mp3",

"audio/lilkim_uhunh.mp3",

"audio/lilscrappy_1.mp3",

"audio/liluzivert_yah2.mp3",

"audio/weezy_14.mp3",

"audio/weezy_22.mp3",

"audio/weezy_29.mp3",

"audio/weezy_4.mp3",

"audio/weezy_16.mp3",

"audio/weezy_17.mp3",

"audio/weezy_25.mp3",

"audio/weezy_30.mp3",

"audio/weezy_31.mp3",

"audio/lilyachty_lilboat.mp3",

"audio/banks_unh.mp3",

"audio/banks_yeah.mp3",

"audio/ludacris_2.mp3",

"audio/ludacris_woo.mp3",

"audio/madeintyo_skrrskrr.mp3",

"audio/mannie_1.mp3",

"audio/mannie_2.mp3",

"audio/mastaace_awwyeah.mp3",

"audio/mceiht_1.mp3",

"audio/mchammer_1.mp3",

"audio/meek_bow.mp3",

"audio/meek_unh.mp3",

"audio/methodman_1.mp3",

"audio/methodman_tical.mp3",

"audio/methodman_yo.mp3",

"audio/metro_somemo.mp3",

"audio/mikejones_2.mp3",

"audio/mikejones_iceage.mp3",

"audio/mikejones_jyeah.mp3",

"audio/mop_1.mp3",

"audio/mop_2.mp3",

"audio/nas_1.mp3",

"audio/nas_3.mp3",

"audio/nas_6.mp3",

"audio/natedogg_1.mp3",

"audio/nicki_augh.mp3",

"audio/nicki_cat.mp3",

"audio/nicki_laugh2.mp3",

"audio/nicki_ok.mp3",

"audio/nicki_unh.mp3",

"audio/nicki_youngmoney.mp3",

"audio/nore_1.mp3",

"audio/biggie_1.mp3",

"audio/biggie_2.mp3",

"audio/oj_4.mp3",

"audio/odb_shimmy.mp3",

"audio/odb_yo.mp3",

"audio/pharrell_1.mp3",

"audio/pharrell_2.mp3",

"audio/pill_1.mp3",

"audio/pimpc_4.mp3",

"audio/pimpc_1.mp3",

"audio/pimpc_sweetjones3.mp3",

"audio/pitbull_1.mp3",

"audio/pitbull_2.mp3",

"audio/pitbull_3.mp3",

"audio/pitbull_6.mp3",

"audio/problem_what2.mp3",

"audio/projectpat_1.mp3",

"audio/pushat_1.mp3",

"audio/pushat_haha.mp3",

"audio/pushat_unh.mp3",

"audio/pushat_haha3.mp3",

"audio/quavo_ayy.mp3",

"audio/quavo_gone2.mp3",

"audio/quavo_ugh.mp3",

"audio/quavo_youngnigga.mp3",

"audio/quavo_migo.mp3",

"audio/raekwon_yo.mp3",

"audio/raesremmurd_hay.mp3",

"audio/redman_heyo.mp3",

"audio/richhomie_hey.mp3",

"audio/richhomie_quan.mp3",

"audio/ross_1.mp3",

"audio/ross_2.mp3",

"audio/ross_4.mp3",

"audio/ross_woo.mp3",

"audio/schoolboy_yawk.mp3",

"audio/seanprice_1.mp3",

"audio/thugga_2.mp3",

"audio/thugga_3.mp3",

"audio/snoop_5.mp3",

"audio/snoop_4.mp3",

"audio/snoop_1.mp3",

"audio/soulja_2.mp3",

"audio/soulja_4.mp3",

"audio/soulja_5.mp3",

"audio/swizz_1.mp3",

"audio/swizz_goddamit.mp3",

"audio/takeoff_ayy.mp3",

"audio/takeoff_bitch.mp3",

"audio/takeoff_graaa.mp3",

"audio/takeoff_lean.mp3",

"audio/takeoff_money.mp3",

"audio/takeoff_takeoff.mp3",

"audio/takeoff_woo.mp3",

"audio/takeoff_woowoo.mp3",

"audio/takeoff_damn.mp3",

"audio/takeoff_ugh.mp3",

"audio/ti_5.mp3",

"audio/ti_2.mp3",

"audio/ti_3.mp3",

"audio/ti_22.mp3",

"audio/ti_32.mp3",

"audio/tooshort_1.mp3",

"audio/tpain_2.mp3",

"audio/tpain1.mp3",

"audio/trapaholics_1.mp3",

"audio/trapaholics_damnson.mp3",

"audio/traviscott_laflame.mp3",

"audio/traviscott_straightup.mp3",

"audio/traviscott_yah.mp3",

"audio/treysongz_4.mp3",

"audio/treysongz_uhunh.mp3",

"audio/trick_1.mp3",

"audio/trick_2.mp3",

"audio/trick_4.mp3",

"audio/tydolla_dollasign.mp3",

"audio/tyga_unh.mp3",

"audio/vado_1.mp3",

"audio/waka_1.mp3",

"audio/waka_8.mp3",

"audio/willsmith_1.mp3",

"audio/willsmith_2.mp3",

"audio/willsmith_3.mp3",

"audio/wiz_1.mp3",

"audio/wiz_unh.mp3",

"audio/yg_skrrt.mp3",

"audio/yogotti_yeah.mp3",

"audio/jeezy_10.mp3",

"audio/jeezy_11.mp3",

"audio/jeezy_1.mp3",

"audio/youngthug_boss.mp3",

"audio/youngthug_ew.mp3",

"audio/youngthug_git.mp3",

"audio/youngthug_ish.mp3",

"audio/youngthug_phoo.mp3",

"audio/youngthug_wha.mp3"]

sounds_test = ["audio/youngthug_wha.mp3"]

sounds.each do |sound|
  uri = "http://www.therapboard.com/" + sound
  puts uri
  File.open(File.basename(uri),'wb'){ |f| f.write(open(uri).read) }
end

# Nokogiri::HTML(open(URL)).xpath("//img/@src").each do |src|
#   uri = URI.join( URL, src ).to_s # make absolute uri
#   File.open(File.basename(uri),'wb'){ |f| f.write(open(uri).read) }
# end
