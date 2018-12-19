<?php

namespace common\models\common\wechat;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\common\wechat\WechatMenu;

/**
 * WechatMenuSearch represents the model behind the search form about `common\models\common\wechat\WechatMenu`.
 */
class WechatMenuSearch extends WechatMenu
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'pid', 'sort'], 'integer'],
            [['title', 'type', 'url', 'media_id', 'appid', 'pagepath'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = WechatMenu::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'pid' => $this->pid,
            'sort' => $this->sort,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'type', $this->type])
            ->andFilterWhere(['like', 'url', $this->url])
            ->andFilterWhere(['like', 'media_id', $this->media_id])
            ->andFilterWhere(['like', 'appid', $this->appid])
            ->andFilterWhere(['like', 'pagepath', $this->pagepath]);

        return $dataProvider;
    }
}
