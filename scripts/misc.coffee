# Description:
#   雑な感じの返答をするよ
module.exports = (robot) ->
  robot.respond /(こつ|コツ|方法)/, (res) ->
    res.send "降ってきたノーツをつくやけどす"

  robot.respond /ここはどこ/i, (msg) ->
    msg.send "ここは #{msg.user.room}"
