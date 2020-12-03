# テーブル設計

## users テーブル
| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| nickname           | string  | null: false |
| profile            | text    | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| veg_id             | integer | null: false |
| vatch_id           | integer | null: false |
| sex_id             | integer | null: false |
| blood_type_id      | integer | null: false |
| prefecture_id      | integer | null: false |
| birth_day          | date    | null: false |

### Association
- has_one  :card
- has_many :posts
- has_many :community_users 
- has_many :communities, through: :community_users 
- has_many :message_users 
- has_many :messages, through: :message_users 
- has_many :like_posts 
- has_many :likes, through: :like_posts 
- has_many :like_comments 
- has_many :comments, through: :like_comments
  # ====================自分がフォローしているユーザーとの関連 ================================
  #フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので親はfollowing_id(フォローする側)
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  # 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「followings」と定義
  has_many :followings, through: :active_relationships, source: :follower
  # ==================================================================================

  # ====================自分がフォローされるユーザーとの関連 ==================================
  #フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローされる側)
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  # 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「followers」と定義
  has_many :followers, through: :passive_relationships, source: :following
  # =================================================================================






## massages テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| text             | text       | null: false                    |

### Association
- has_many :message_users 
- has_many :users, through: :message_users 


## massage_users テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| message          | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :message
- belongs_to :user






## relationships テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| following       | integer    |                                |
| follower        | integer    |                                |

### Association
- belongs_to :following, class_name: "User"
- belongs_to :follower, class_name: "User"







## cards テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_token      | string     | null: false                    |
| customer_token  | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user







## communities テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| text             | text       | null: false                    |

### Association
- has_many :community_users  
- has_many :users, through: :community_users  
- has_many :community_posts   
- has_many :posts, through: :community_posts   


## community_users テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| community        | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :community
- belongs_to :user


## community_posts テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| community        | references | null: false, foreign_key: true |
| post             | references | null: false, foreign_key: true |

### Association
- belongs_to :community
- belongs_to :post






## posts テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| text            | text       | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :community_posts
- has_many :communities, through: :community_posts
- has_many :tag_posts  
- has_many :tags, through: :tag_posts
- has_many :comments  
- has_many :like_posts





## comments テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| text            | text       | null: false                    |
| user            | references | null: false, foreign_key: true |
| post            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :post
- has_many :tag_comments  
- has_many :tags, through: :tag_comments 
- has_many :like_comments





## tags テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| text            | text       | null: false                    |

### Association
- has_many :tag_comments 
- has_many :comments, through: :tag_comments 
- has_many :tag_posts 
- has_many :posts, through: :tag_posts 

## tag_comments テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| tag              | references | null: false, foreign_key: true |
| comment          | references | null: false, foreign_key: true |

### Association
- belongs_to :tag
- belongs_to :comment


## tag_posts テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| tag              | references | null: false, foreign_key: true |
| post             | references | null: false, foreign_key: true |

### Association
- belongs_to :tag
- belongs_to :post







## like_posts テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post            | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :post
- belongs_to :user

## like_comments  テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| comment         | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :comment
- belongs_to :user

