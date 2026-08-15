// Re-fit whenever the browser window is resized, zoomed, or the device rotated.
// refresh() no-ops unless the available area actually changed.
refresh();

// The application surface can be (re)created by the runtime after a resize,
// so keep it matched to the canvas every step.
sync_application_surface();
