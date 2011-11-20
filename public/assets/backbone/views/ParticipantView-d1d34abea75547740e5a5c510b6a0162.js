Wormies.Views.ParticipantView=Backbone.View.extend({initialize:function(){return this.model.bind("change:id",$.proxy(this.onIdChange,this)),this.model.bind("change:state",$.proxy(this.onStateChange,this))},template:JST["backbone/templates/participant"],events:{"click .remove":"onRemoveClick","click .tostage":"onToStageClick","click .offstage":"offStageClick"},onRemoveClick:function(){return $(document).trigger("remove",this.model)},onToStageClick:function(){return $(document).trigger("toStage",this.model)},offStageClick:function(){return $(document).trigger("offStage",this.model)},onIdChange:function(a){return this.el.attr("id",a.id)},onStateChange:function(a,b){return this.el.removeClass(),this.el.addClass(a.get("state")),this.setAudioSubscribe()},render:function(){var a;return this.el.html(this.template),this.model.get("stream")?(a=app.get("session").subscribe(this.model.get("stream"),"videoContainer"),this.model.set({subscriber:a}),this.setAudioSubscribe()):app.get("session").publish("videoContainer")},setAudioSubscribe:function(){var a;a=this.model.get("subscriber");if(a!=null)return this.model.get("state")==="guest"||this.model.get("state")==="host"?this.model.get("subscriber").subscribeToAudio(!0):this.model.get("subscriber").subscribeToAudio(!1)}})