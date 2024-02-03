import streamlit as st
import pandas as pd
import numpy as np

st.header('Ramanirajan Jhunjhunwala College')
st.divider()
st.subheader('Department Of Statistics')
st.write('Department of Statistics is conducting a survey regarading to the quality of teaching provided by the department.Thus your response is valuable for the department and will help in improving the quality of education.')
tab1,tab2 = st.tabs([' Information about the teachers ','Feedback Survey'])

#with tab1:
    #df=pd.read_csv("employees.csv")
    #st.table(df.head(8))

with tab2:
    with st.form('Feedback_Form'):
        st.header('Feedback Form')
        st.write('Write Your feedback for the department')

        col1, col2 , col3 = st.columns(3)
        with col1:
            Comfort = st.text_input('How comfortable are you with the teaching methods')
            Improvments=st.text_input('Suggest impovement for the Department')
            Rating = st.slider('How would you rate the department',0,10,5)

        with col2:
            #Date = st.date_input('Enter Date')
            Class = st.radio('Select your classs', ('FY', 'SY', 'TY', 'MSc Part 1', 'MSc Part 2'))
  
         
        if st.form_submit_button('Submit'):
            df1=pd.DataFrame({'Comfort':[Comfort],'Improvement':[Improvments],'Rating':[Rating],'Class':[Class]})
            df2=pd.DataFrame({'Comfort':[],'Improvement':[],'Rating':[],'Class':[]}) 
            df2 = pd.concat([df2,df1])
            st.table(df2)
    
    if st.button('Download Feedback'):
        df2.to_csv('survey.csv',header=False,index=False)

