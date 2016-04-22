Helper  = require("hubot-test-helper")
helper  = new Helper("../src/star-wars.coffee")
expect  = require("chai").expect

class MockResponse extends Helper.Response
  random: (items) ->
    "http://i.imgur.com/fE18keE.gif"

describe "robot responds to the word 'noo'", ->

  beforeEach ->
    @room = helper.createRoom({"response": MockResponse})
    @robot = @room.robot

  afterEach ->
    @room.destroy()

  context "when user enters valid characters", ->

    it "should reply with image", ->
      @room.user.say("Josh", "NOooOOOOO.").then =>
        expect(@room.messages[1]).to.eql ["hubot", "http://i.imgur.com/fE18keE.gif"]

  context "when user enters invalid characters", ->

    it "should not reply", ->
      @room.user.say("Josh", "nooooooooon").then =>
        expect(@room.messages[1]).to.not.eql ["hubot", "http://i.imgur.com/fE18keE.gif"]

      @room.user.say("Josh", "no").then =>
        expect(@room.messages[1]).to.not.eql ["hubot", "http://i.imgur.com/fE18keE.gif"]

describe "robot responds to the phrase 'a trap'", ->

  beforeEach ->
    @room = helper.createRoom({"response": MockResponse})
    @robot = @room.robot

  afterEach ->
    @room.destroy()

  context "when user enters valid characters", ->

    it "should reply with image", ->
      @room.user.say("Josh", "Seems like a trap!").then =>
        expect(@room.messages[1]).to.eql ["hubot", "http://i.imgur.com/fE18keE.gif"]

  context "should not reply when user enters invalid characters", ->

    it "if there are no word boundaries", ->
      @room.user.say("Josh", "Some type ofa trapper").then =>
        expect(@room.messages[1]).to.not.eql ["hubot", "http://i.imgur.com/fE18keE.gif"]

    it "if there is no space between words", ->
      @room.user.say("Josh", "atrap").then =>
        expect(@room.messages[1]).to.not.eql ["hubot", "http://i.imgur.com/fE18keE.gif"]
