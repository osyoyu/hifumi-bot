iidxs = []
iidxs[1] = require('./iidx_sp1.json')
iidxs[2] = require('./iidx_sp2.json')
iidxs[3] = require('./iidx_sp3.json')
iidxs[4] = require('./iidx_sp4.json')
iidxs[5] = require('./iidx_sp5.json')
iidxs[6] = require('./iidx_sp6.json')
iidxs[7] = require('./iidx_sp7.json')
iidxs[8] = require('./iidx_sp8.json')
iidxs[9] = require('./iidx_sp9.json')
iidxs[10] = require('./iidx_sp10.json')
iidxs[11] = require('./iidx_sp11.json')
iidxs[12] = require('./iidx_sp12.json')

# Description:
#   Messing around with the YouTube API.
#
# Commands:
#   hubot おすすめ - おすすめっぽい曲を教えてくれる
module.exports = (robot) ->
  ddr_sp14 = [
    '888 (EXPERT)',
    'IX (DIFFICULT)',
    'ACROSS WORLD (CHALLENGE)',
    'Adularia (EXPERT)',
    'AETHER (DIFFICULT)',
    'AM-3P -"CHAOS" Special- (CHALLENGE)',
    'Anti-Matter (DIFFICULT)',
    'B4U -"VOLTAGE" Special- (CHALLENGE)',
    'CHAOS (EXPERT)',
    'Confession (CHALLENGE)',
    'Daily Lunch Special (EXPERT)',
    'Determination (EXPERT)',
    'Diamond Night (CHALLENGE)',
    'Elemental Creation (DIFFICULT)',
    'Empathetic (EXPERT)',
    'FIRE FIRE (EXPERT)',
    'Healing-D-Vision (EXPERT)',
    'Healing Vision (X-Special) (CHALLENGE)',
    'HYENA (EXPERT)',
    'IMANOGUILTS (EXPERT)',
    'JOKER (CHALLENGE)',
    'KEEP ON MOVIN\' (Y&Co. DJ BOSS remix) (EXPERT)',
    'La libertad (CHALLENGE)',
    'London EVOLVED ver.A (EXPERT)',
    'London EVOLVED ver.B (EXPERT)',
    'London EVOLVED ver.C (EXPERT)',
    'NEPHILIM DELTA (EXPERT)',
    'New Decade (DIFFICULT)',
    'New Generation (EXPERT)',
    'New Gravity (CHALLENGE)',
    'nightbird lost wing (EXPERT)',
    'on the bounce (EXPERT)',
    'PARANOIA EVOLUTION (X-Special) (CHALLENGE)',
    'PARANOiA Rebirth (X-Special) (CHALLENGE)',
    'PARANOiA Revolution (DIFFICULT)',
    'Pierce The Sky (EXPERT)',
    'Pluto (EXPERT)',
    'Pluto Relinquish (DIFFICULT)',
    'Pluto The First (DIFFICULT)',
    'Poseidon (kors k mix) (EXPERT)',
    'POSSESSION (DIFFICULT)',
    'PRANA (EXPERT)',
    'PUNISHER (EXPERT)',
    'RЁVOLUTIΦN (EXPERT)',
    'Right on time (Ryu☆Remix) (EXPERT)',
    'Sakura Sunrise (EXPERT)',
    'Second Heaven (CHALLENGE)',
    'second spring storm (EXPERT)',
    'Shiny World (EXPERT)',
    'Strobe♡Girl (EXPERT)',
    'Summer Fairytale (CHALLENGE)',
    'Synergy For Angels (EXPERT)',
    'Tell me what to do (CHALLENGE)',
    'The Wind of Gold (EXPERT)',
    'Tohoku EVOLVED (DIFFICULT)',
    'Top The Charts (CHALLENGE)',
    'TRIP MACHINE CLIMAX (X-Special) (CHALLENGE)',
    'VEGA (EXPERT)',
    'ウッーウッーウマウマ(ﾟ∀ﾟ)(Speedcake Remix) (CHALLENGE)',
    '革命 (X-Special) (CHALLENGE)',
    '恋はどう？モロ◎波動OK☆方程式！！ (EXPERT)',
    'この子の七つのお祝いに (EXPERT)',
    'ドキドキ☆流星トラップガール!! (EXPERT)',
    'セツナトリップ (EXPERT)',
    '不沈艦CANDY (EXPERT)',
    'マインド･ゲーム (EXPERT)',
    '野球の遊び方 そしてその歴史 ～決定版～ (EXPERT)'
  ]

  robot.respond /おすすめ (.*) (.*)/i, (msg) ->
    channel = msg.message.room

    if channel == 'beatmania2dx'
      if msg.match[1]
        song = msg.random(iidxs[parseInt(msg.match[1], 10)])
        result = "#{song.name} (N: ☆#{song.spn} / H: ☆#{song.sph} / A: ☆#{song.spa})"
      else
        result = msg.random(iidx)
    else if channel == 'ddr'
      result = msg.random(ddr_sp14)
    else
      result = "ここには何も登録されてないよ"

    if msg.match[2]
      query = msg.match[2]
      robot.http("http://gdata.youtube.com/feeds/api/videos")
        .query({
          orderBy: "relevance"
          'max-results': 15
          alt: 'json'
          q: query
        })
        .get() (err, res, body) ->
          videos = JSON.parse(body)
          videos = videos.feed.entry

          unless videos?
            return

          video  = msg.random videos
          video.link.forEach (link) ->
            if link.rel is "alternate" and link.type is "text/html"
              result += link.href

    msg.send result
