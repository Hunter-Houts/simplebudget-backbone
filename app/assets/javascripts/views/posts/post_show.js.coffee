class Simplebudget.Views.PostShow extends Backbone.View
  template: HandlebarsTemplates['posts/show']

  events:
    # 'submit .replyForm': 'createReply'
    'click #show': 'showCommentForm'
    'submit #commentForm': 'createComment'
    'click .editComment': 'showCommentEdit'
    'click .showReply': 'showReplyForm'
    'click .editReply': 'showReplyEditForm'


  initialize: ->
    @comment = new Simplebudget.Models.Comment()
    @reply = new Simplebudget.Models.Comment()
    @session = new Simplebudget.Models.Session()
    @replies = new Simplebudget.Collections.Replies([],{id: this.id})
    @replies.on('sync change',@render, this)
    @comments = new Simplebudget.Collections.Comments([],{id: this.id})
    @comments.on('sync change', @render, this)
    @session.on('sync change', @render, this)
    @model = new Simplebudget.Models.Post({id: this.id})
    @model.on('sync change', @render, this)
    @model.fetch()
    @comments.fetch()
    @replies.fetch()
    @session.fetch()

  render: ->
    $(@el).html(@template(post: @model.toJSON(), current_user: @session.toJSON(), comments: @comments.toJSON(), replies: @replies.toJSON()))
    this

  showCommentForm: (event) ->
    event.preventDefault()
    button = document.getElementById("show")
    commentForm = document.getElementById("commentForm")
    commentForm.style.display = "block"
    button.style.display = "none"

  createComment: (event) ->
    event.preventDefault()
    commentBody = $("#comment").val()
    if @comment.save({commentbody: commentBody, post_id: @model.id}, wait: true, error: @handleError)
      window.location.href = '/posts/' + @model.id

  showCommentEdit: (event) ->
    event.preventDefault()
    editForm = Array.from(document.getElementsByClassName("editForm"))
    editComment = Array.from(document.getElementsByClassName("editComment"))
    deleteComment = Array.from(document.getElementsByClassName("deleteComment"))
    editComment.forEach((element, index) ->
      element.addEventListener('click', (e) ->
        e.preventDefault()
        editForm[index].style.display = "block"
        deleteComment[index].style.display = "block"))


  handleError: (entry, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages

  showReplyForm: (event) ->
    event.preventDefault()
    replyForm = Array.from(document.getElementsByClassName("replyForm"))
    showReply = Array.from(document.getElementsByClassName("showReply"))
    showReply.forEach((element, index) ->
      element.addEventListener('click', (e) ->
        e.preventDefault()
        replyForm[index].style.display = "block"))

  createReply: (event) ->
    event.preventDefault()
    reply = $("#reply").val()
    commentId = $("#commentId").text()
    if @reply.save({commentbody: reply, post_id: @model.id, comment_id: Number(commentId)}, wait: true, error: @handleError)
      window.location.href = '/posts/' + @model.id

  showReplyEditForm: (event) ->
    event.preventDefault()
    editReply = Array.from(document.getElementsByClassName("editReply"))
    editReplyForm = Array.from(document.getElementsByClassName("editReplyForm"))
    editReply.forEach((element, index) ->
      element.addEventListener('click', (e) ->
        e.preventDefault()
        editReplyForm[index].style.display = "block"))

