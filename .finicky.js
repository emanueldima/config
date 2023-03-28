module.exports = {
    defaultBrowser: "Google Chrome",
    handlers: [{
        match: [
            "meet.google.com/*",
            "*.google.com/*", "google.com/*",
            "github.com/*", "*.github.com/*",
            "digital-science.atlassian.net/*",
            "*.atlassian.net/*",
            "*figshare*"
        ],
        browser: "Google Chrome",
    }],
};
