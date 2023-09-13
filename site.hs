--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll
import qualified Data.Set as S
import           Text.Pandoc.Options
import Data.List (isSuffixOf)
import System.FilePath (takeDirectory, (</>), takeBaseName, splitExtension, splitFileName, (<.>))



--------------------------------------------------------------------------------
main :: IO ()
main = hakyllWith config $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "files/*" $ do
    	route   idRoute
	compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match (fromList ["about.md"]) $ do
        route   $ setExtension "html" `composeRoutes` 
	          appendIndex
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    match "posts/*" $ do
        route $ setExtension "html" `composeRoutes`
	        dropPostsPrefix     `composeRoutes`
		appendIndex
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/post.html"    postCtx
	    >>= saveSnapshot "content"
            >>= loadAndApplyTemplate "templates/default.html" postCtx
            >>= relativizeUrls

    create ["archive.html"] $ do
        route $ setExtension "html" `composeRoutes` 
	        appendIndex        
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let archiveCtx =
                    listField "posts" postCtx (return posts) `mappend`
		    constField "title" "Archive"             `mappend`
		    dropIndexHtml "url"                      `mappend`
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                >>= relativizeUrls

    create ["rss.xml"] $ do
        route idRoute
        compile $ do
            let feedCtx = postCtx `mappend` bodyField "description"
            posts <- fmap (take 10) . recentFirst =<< loadAllSnapshots "posts/*" "content"
            renderRss myFeedConfiguration feedCtx posts


    match "index.md" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
	        >>= loadAndApplyTemplate "templates/default.html" defaultContext
                >>= relativizeUrls

    match "templates/*" $ compile templateBodyCompiler


--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    dropIndexHtml "url"          `mappend`
    defaultContext

----------------------------------------------------

config :: Configuration
config = defaultConfiguration
    { destinationDirectory = "docs"
    }

-----------------------------------------------------

myFeedConfiguration :: FeedConfiguration
myFeedConfiguration = FeedConfiguration
	{ feedTitle = "Random Walks"
	, feedDescription = "posts and musings"
	, feedAuthorName = "Yudhister Kumar"
	, feedAuthorEmail = "kumar.yudhister@proton.me"
	, feedRoot = "https://ykumar.org/"
	}

------------------------------------------------------

dropPostsPrefix :: Routes
dropPostsPrefix = gsubRoute "posts/" $ const ""

---------------------------------------------------------

appendIndex :: Routes
appendIndex = customRoute $ 
    (\(p, e) -> p </> "index" <.> e) . splitExtension . toFilePath

------------------------------------------------------------

dropIndexHtml :: String -> Context a
dropIndexHtml key = mapContext transform (urlField key) where
    transform url = case splitFileName url of
                        (p, "index.html") -> takeDirectory p
			_                 -> url






