#!/usr/bin/python3
"""
Queries the Reddit API and returns the number of total subscribers for a given
subreddit.
"""
import requests


def number_of_subscribers(subreddit):
    """
    Queries the Reddit API and returns the number of total subscribers for a
    given subreddit.
    """
    url = f"http://www.reddit.com/r/{subreddit}/about.json"
    headers = {'user-Agent': 'request'}
    response = requests.get(url, headers=headers, allow_redirects=False)
    
    if response.status_code != 200:
        return 0
    data = response.json().get("data")
    num_sub = data.get("subscribers")
    
    return num_subs
