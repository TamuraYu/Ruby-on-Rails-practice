class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|

      t.integer :song_id,   null: false                   # id
      t.string  :song_title,null: false                   # タイトル
      t.string  :song_url,  null: false                   # URL
      t.float   :sizuka,    null: false,  default:  5     # 静か
      t.float   :yukkuri,   null: false,  default:  5     # ゆっくりした
      t.float   :zinkou,    null: false,  default:  5     # 人工的な
      t.float   :sukitoru,  null: false,  default:  5     # 透き通った
      t.float   :tantyo,    null: false,  default:  5     # 単調な
      t.float   :akarui,    null: false,  default:  5     # 明るい
      t.float   :atarashi,  null: false,  default:  5     # 新しい
      t.float   :sodai,     null: false,  default:  5     # 壮大な
      t.float   :juko,      null: false,  default:  5     # 重厚な
      t.float   :daitan,    null: false,  default:  5     # 大胆な
      t.float   :otituita,  null: false,  default:  5     # 落ち着いた
      t.float   :dainamikku,null: false,  default:  5     # ダイナミックな
      t.integer :counts,    null: false,  default:  0     # 探索回数
      t.float   :tekigou,   null: false,  default:  0     # 適合率
      t.timestamps
    end
  end
end
