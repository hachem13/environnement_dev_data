import dash
import dash_core_components as dcc
import dash_html_components as html
import pandas as pd
import plotly.graph_objs as go


app = dash.Dash()
colors = {
    'background': '#00000',
    'text': '#111111'
}

timesData = pd.read_csv("/Users/mosbahhachem/Documents/Cours/Data/timesData.csv")
df = timesData.iloc[:20,:]
#df = df.dropna().head(20)
print(df)
app.layout = html.Div(style={'backgroundColor': colors['background']}, children=[
    html.H1(
        children='le nombre d’étudiants total en fonction du Ratio étudiant féminin / étudiant masculin pour les 20 premières université ',
        style={
            'textAlign': 'center',
            'color': colors['text']
        }
    ),
    html.Div(children='Dash: A web application framework for Python.', style={
        'textAlign': 'center',
        'color': colors['text']
    }),
    dcc.Graph(
        id='',
        figure={
            'data': [
                go.Scatter(
                    x=df[df['country'] == i]['female_male_ratio'],
                    y=df[df['country'] == i]['num_students'],
                    text=df[df['country'] == i]['university_name'],
                    mode='markers',
                    opacity=0.8,
                    marker={
                        'size': 15,
                        'line': {'width': 0.5, 'color': 'white'}
                    },
                    name=i
                ) for i in df.country.unique()
            ],
            'layout': go.Layout(
                xaxis={'title': 'female male ratio'},
                yaxis={'title': 'university_name'},
                margin={'l': 40, 'b': 40, 't': 10, 'r': 10},
                legend={'x': 0, 'y': 1},
                hovermode='closest'
            )
        }
    )
])
if __name__ == '__main__':
    app.run_server(debug=True)

