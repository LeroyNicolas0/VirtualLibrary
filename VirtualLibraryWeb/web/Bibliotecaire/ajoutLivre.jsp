<%-- 
    Document   : ajoutLivre
    Created on : 14 mars 2018, 17:18:32
    Author     : nicolas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Inscription</title>
        <link type="text/css" rel="stylesheet" href="<c:url value="/inc/style.css"/>" />
                    <link rel="stylesheet" href="<c:url value="/inc/slimselect.min.css" />"/>
    </head>
    <body>
        <form method="post" action="AjoutParticipant">
            <fieldset>
                <legend>Ajouter un Livre</legend>
                <p>Vous pouvez ajouter un Livre via ce formulaire.</p>

                <label for="nom">Titre </label>
                <input type="text" id="titre" name="titre" value="<c:out value="${livre.titre}"/>" size="20" maxlength="20" />
                <span class="erreur">${form.erreurs['nom']}</span>
                <br />
                
                <label for="nom">Date de parution</label>
                <input type="date" name="dateparution" value="<c:out value="${livre.dateparution}"/>" >
                <span class="erreur">${form.erreurs['dateparution']}</span>
                <br />
                
                <label for="nom">Description </label>
                <input type="text" id="description" name="description" value="<c:out value="${livre.description}"/>" size="20" maxlength="20" />
                <span class="erreur">${form.erreurs['description']}</span>
                <br />
                
                <label for="nom">Visible </label>
                <input type="radio" id="visible" name="visible" value="yes" checked /> yes   
                <input type="radio" id="visible" name="visible" value="no"  /> no <br />
                <span class="erreur">${form.erreurs['visible']}</span>
                <br />
                
                <label for="nom">Lien pour l'image de couverture </label>
                <input type="text" id="lien" name="lien" value="<c:out value="${livre.lien}"/>" size="20" maxlength="20" />
                <span class="erreur">${form.erreurs['lien']}</span>
                <br />
                
                <label for="nom">ISBN </label>
                <input type="text" id="isbn" name="isbn" value="<c:out value="${livre.isbn}"/>" size="20" maxlength="20" />
                <span class="erreur">${form.erreurs['isbn']}</span>
                <br />
                
                <label for="nom">Nombre de page </label>
                <input type="number" id="nbpages" name="nbpages" value="<c:out value="${livre.nbpages}"/>" min="0"/>
                <span class="erreur">${form.erreurs['nbpages']}</span>
                <br />
             
                <label for="nom">Choisir la langue  </label>
            <select data-placeholder="Choose a Language..." id="langue" name="langue">
                <option value="Afrikanns">Afrikanns</option>
                <option value="Albanian">Albanian</option>
                <option value="Arabic">Arabic</option>
                <option value="Armenian">Armenian</option>
                <option value="Basque">Basque</option>
                <option value="Bengali">Bengali</option>
                <option value="Bulgarian">Bulgarian</option>
                <option value="Catalan">Catalan</option>
                <option value="Cambodian">Cambodian</option>
                <option value="Chinese (Mandarin)">Chinese (Mandarin)</option>
                <option value="Croation">Croation</option>
                <option value="Czech">Czech</option>
                <option value="Danish">Danish</option>
                <option value="Dutch">Dutch</option>
                <option value="English">English</option>
                <option value="Estonian">Estonian</option>
                <option value="Fiji">Fiji</option>
                <option value="Finnish">Finnish</option>
                <option value="French">French</option>
                <option value="Georgian">Georgian</option>
                <option value="German">German</option>
                <option value="Greek">Greek</option>
                <option value="Gujarati">Gujarati</option>
                <option value="Hebrew">Hebrew</option>
                <option value="Hindi">Hindi</option>
                <option value="Hungarian">Hungarian</option>
                <option value="Icelandic">Icelandic</option>
                <option value="Indonesian">Indonesian</option>
                <option value="Irish">Irish</option>
                <option value="Italian">Italian</option>
                <option value="Japanese">Japanese</option>
                <option value="Javanese">Javanese</option>
                <option value="Korean">Korean</option>
                <option value="Latin">Latin</option>
                <option value="Latvian">Latvian</option>
                <option value="Lithuanian">Lithuanian</option>
                <option value="Macedonian">Macedonian</option>
                <option value="Malay">Malay</option>
                <option value="Malayalam">Malayalam</option>
                <option value="Maltese">Maltese</option>
                <option value="Maori">Maori</option>
                <option value="Marathi">Marathi</option>
                <option value="Mongolian">Mongolian</option>
                <option value="Nepali">Nepali</option>
                <option value="Norwegian">Norwegian</option>
                <option value="Persian">Persian</option>
                <option value="Polish">Polish</option>
                <option value="Portuguese">Portuguese</option>
                <option value="Punjabi">Punjabi</option>
                <option value="Quechua">Quechua</option>
                <option value="Romanian">Romanian</option>
                <option value="Russian">Russian</option>
                <option value="Samoan">Samoan</option>
                <option value="Serbian">Serbian</option>
                <option value="Slovak">Slovak</option>
                <option value="Slovenian">Slovenian</option>
                <option value="Spanish">Spanish</option>
                <option value="Swahili">Swahili</option>
                <option value="Swedish ">Swedish </option>
                <option value="Tamil">Tamil</option>
                <option value="Tatar">Tatar</option>
                <option value="Telugu">Telugu</option>
                <option value="Thai">Thai</option>
                <option value="Tibetan">Tibetan</option>
                <option value="Tonga">Tonga</option>
                <option value="Turkish">Turkish</option>
                <option value="Ukranian">Ukranian</option>
                <option value="Urdu">Urdu</option>
                <option value="Uzbek">Uzbek</option>
                <option value="Vietnamese">Vietnamese</option>
                <option value="Welsh">Welsh</option>
                <option value="Xhosa">Xhosa</option>
            </select>
                 <span class="erreur">${form.erreurs['langue']}</span>
                <br />
                
                <label for="nom">Type Livre</label>
                <input list="typelivre" name="typelivre">
                    <datalist id="typelivre">
                      <option value="Internet Explorer">
                      <option value="Firefox">
                      <option value="Chrome">
                      <option value="Opera">
                      <option value="Safari">
                    </datalist>
                <span class="erreur">${form.erreurs['typelivre']}</span>
                <br />

                
                <input type="submit" value="Ajouter Livre" class="sansLabel" />
                <br />
                
                <p class="${empty form.erreurs ? 'succes' : 'erreur'}">${form.resultat}</p>
            </fieldset>
        </form>
            
            <script src="<c:url value="/slimselect.min.js" />">  
                import SlimSelect from 'slim-select-min'
                var select = new SlimSelect({
                    select: '#langue'
                    });
        </script>

            
    </body>
</html>