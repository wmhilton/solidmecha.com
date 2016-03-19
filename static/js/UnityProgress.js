function UnityProgress (dom) {
	this.progress = 0.0;
	this.message = "";
	this.dom = dom;

	this.SetProgress = function (progress) {
    console.log(progress, performance.now());
		if (this.progress < progress)
			this.progress = progress;
    // if (progress > 0.0) {
    //   document.getElementById('loader-thing').style.opacity = "0";
    // }
		this.Update();
	}

	this.SetMessage = function (message) {
		this.message = message;
		this.Update();
	}

	this.Clear = function() {
    document.body.classList.add('showing-game');
	}

	this.Update = function() {
	}

	this.Update ();
}
