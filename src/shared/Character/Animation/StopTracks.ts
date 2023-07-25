export = (animator: Animator) => {
    for (const track of animator.GetPlayingAnimationTracks()) {
        track.Stop(0)
        // track.Destroy()
    }
}