<?php

namespace common\models\common\base;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\common\base\BaseBanner;

/**
 * BaseBannerSearch represents the model behind the search form about `common\models\common\base\BaseBanner`.
 */
class BaseBannerSearch extends BaseBanner
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'addtime', 'order', 'isshow'], 'integer'],
            [['title', 'img', 'jump'], 'safe'],
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
        $query = BaseBanner::find();

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
            'addtime' => $this->addtime,
            'order' => $this->order,
            'isshow' => $this->isshow,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'img', $this->img])
            ->andFilterWhere(['like', 'jump', $this->jump]);

        return $dataProvider;
    }
}
