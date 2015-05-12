# Description:
#   Messing around with the YouTube API.
#
# Commands:
#   hubot おすすめ - おすすめっぽい曲を教えてくれる
module.exports = (robot) ->
  util = require('util')

  tag_alias_table = {
    "beatmania2dx": {
      prefix: "iidx_",
      aliases: {
        "all": "all",
        "1": "sp1",
        "2": "sp2",
        "3": "sp3",
        "4": "sp4",
        "5": "sp5",
        "6": "sp6",
        "7": "sp7",
        "8": "sp8",
        "9": "sp9",
        "10": "sp10",
        "11": "sp11",
        "12": "sp12",
        "皿": "scratch",
        "連皿": "scratch",
        "皿曲": "scratch"
      }
    }
  }

  songs = {
    "iidx_all": [
      {
        spn: 5,
        sph: 9,
        spa: 10,
        name: "Beastie Starter"
      },
      {
        spn: 9,
        sph: 11,
        spa: 12,
        name: "Fascination MAXX"
      }
    ],
    "iidx_sp1": require('./iidx_sp1.json'),
    "iidx_sp2": require('./iidx_sp2.json'),
    "iidx_sp3": require('./iidx_sp3.json'),
    "iidx_sp4": require('./iidx_sp4.json'),
    "iidx_sp5": require('./iidx_sp5.json'),
    "iidx_sp6": require('./iidx_sp6.json'),
    "iidx_sp7": require('./iidx_sp7.json'),
    "iidx_sp8": require('./iidx_sp8.json'),
    "iidx_sp9": require('./iidx_sp9.json'),
    "iidx_sp10": require('./iidx_sp10.json'),
    "iidx_sp11": require('./iidx_sp11.json'),
    "iidx_sp12": require('./iidx_sp12.json'),
    "iidx_scratch": [
      {
        spn: 7,
        sph: 10,
        spa: 12,
        name: "灼熱 Beach Side Bunny"
      },
      {
        spn: 7,
        sph: 9,
        spa: 11,
        name: "CHECKING YOU OUT"
      }
    ],
    "ddr_sp14": [
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
  }

  robot.respond /おすすめ ?(.*)/i, (msg) ->
    response = ""

    channel = msg.message.room
    if channel == 'Shell'
      channel = 'beatmania2dx'

    tag = msg.match[1]
    tag ||= "all"

    song = song_select(channel, tag)
    unless song
      msg.send "タグ #{tag} には何も登録されてないよ！"
      return

    if channel == 'beatmania2dx'
      response += "#{song.name} (N#{song.spn} / H#{song.sph} / A#{song.spa})\n"

    else if channel == 'ddr'
      response += "#{song}"

    else
      result += "このチャンネルには何も登録されてないよ"

    msg.send response


  # Tag Aliasing
  song_select = (game, tag) ->
    if "#{game}_#{tag}" of songs
      original_tag = "#{game}_#{tag}"
    else
      original_tag = tag_alias_table[game].prefix + tag_alias_table[game].aliases[tag]

    if songs[original_tag]
      return songs[original_tag][Math.floor(Math.random() * songs[original_tag].length)]
    else
      return null
