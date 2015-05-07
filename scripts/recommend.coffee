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

  robot.respond /おすすめ/i, (msg) ->
    channel = msg.message.room

    if channel == 'ddr'
      result = msg.random(ddr_sp14)
    else
      result = "ここには何も登録されてないよ"

    msg.send result
