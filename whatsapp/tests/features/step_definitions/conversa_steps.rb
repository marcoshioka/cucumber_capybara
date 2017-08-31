#encoding:utf-8

Dado(/^que eu esteja logado em uma conta no Whatsapp Web$/) do
visit 'https://web.whatsapp.com/'
page.should have_content("Mantenha seu telefone conectado")
end

Quando(/^eu envio uma mensagem para um contato pesquisado$/) do
find(:xpath, ".//*[@id='side']/div[2]/div/label/input").set "Leandro Estevão"
find(:xpath, ".//*[@id='side']/div[2]/div/label/input").native.send_keys(:enter)
find(:xpath, ".//*[@id='main']/footer/div[1]/div[2]/div/div[2]").set "Teste automatizado final - Se recebeu é pass"
find(:xpath, ".//*[@id='main']/footer/div[1]/button/div").click
 
end

Então(/^o sistema apresenta a mensagem enviada$/) do
page.first(:xpath, ".//*[@id='main']").text.should have_content("Teste automatizado final - Se recebeu é pass")
page.execute_script "window.close();"

end