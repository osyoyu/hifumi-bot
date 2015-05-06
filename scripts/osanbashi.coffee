# Description:
#   大桟橋
module.exports = (robot) ->
  robot.hear /大(桟|さん)橋/i, (res) ->
    res.send "https://www.youtube.com/watch?v=TF__ODoRIJI"

  robot.hear /風に吹かれて/i, (res) ->
    res.send "波打つ水の"

  robot.hear /(潮|塩|しお)の香りに/i, (res) ->
    res.send "包まれる"

  robot.hear /空に浮かぶ/i, (res) ->
    res.send "雲流るるは"

  robot.hear /揺られて進むか/i, (res) ->
    res.send "海の橋"
