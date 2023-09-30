const chatUrl = 'https://chat.openai.com/';

chrome.tabs.onUpdated.addListener(async function (tabId, changeInfo, tab) {
    if (isChatOpenTab(tabId, changeInfo, tab)) {
        try {
            await handleChatOpenTab(tab);
        } catch (error) {
            console.error(error);
        }
    }
});

function isChatOpenTab(tabId, changeInfo, tab) {
    return (changeInfo.status === 'complete' && tab.url.startsWith(chatUrl) && tab.url.endsWith('popUp=true'));
}

async function handleChatOpenTab(tab) {
    try {
        const currentWindow = await chrome.windows.get(tab.windowId);
        await chrome.windows.create({url: chatUrl, type: 'popup'});
        await chrome.windows.remove(currentWindow.id);
    } catch (error) {
        throw error;
    }
}
