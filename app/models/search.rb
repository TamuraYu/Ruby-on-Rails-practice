class Search < ApplicationRecord

    def comparison # 今は使ってない
        return %Q{<script type="application/javascript" src="https://embed.nicovideo.jp/watch/sm33351113/script?w=720&h=480"></script><noscript><a href="http://www.nicovideo.jp/watch/sm33351113">kick/音街ウナ</a></noscript>}
        # 上のスクリプトをDBから返して挙げるプログラムを書きたい
    end
end
