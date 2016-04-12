chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'
Helper = require('hubot-test-helper')

expect = chai.expect

helper = new Helper('../index.coffee')

waitForReplies = (number, room, callback) ->
  setTimeout(->
    if room && room.messages.length >= number
      callback(room)
    else
      waitForReplies(number, room, callback)
  )

lastMessageContent = (room) ->
  room.messages[room.messages.length - 1][1]

describe 'star-wars', ->

  beforeEach ->
    @room = helper.createRoom();
    @robot = @room.robot

  afterEach ->
    @room.destroy()

  context "user types the word no with three or more o's", ->
    it "should reply to user", ->
      console.log @room.user.say('Josh', 'something')
      #@room.user.say("Josh", "nooo").then =>
        #console.log response.text
        # expect(response.text)

# describe 'example', ->
#   beforeEach ->
#     @robot =
#       hear: sinon.spy()

#     require('../src/star-wars')(@robot)

#   it 'registers a hear listener', ->
#     expect(@robot.hear).to.have.been.calledWith(/noooo/)

  # it 'registers a hear listener', ->
  #   expect(@robot.hear).to.have.been.calledWith(/orly/)
