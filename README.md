# star_movie

# idf flutter lab

Star Movie app is the simple app for browsing a popular movies (trakt.tv API)
and view peoples cast and base information about it

## How to Launch

1. Create keys.json file in the root of the project, with content:
{
"traktApiKey": "...", // trakt.tv apiKey
"omdbApiKey": "...", // omdbapi.com apiKey
"tmdbApiKey": "..." // developers.themoviedb.org ApiKey 
}

2. Generate domain models by running "flutter pub run build_runner build" in the root/packages/domain

3. Generate Localization files by running "flutter pub global run intl_utils:generate" in the
root/packages/presentation