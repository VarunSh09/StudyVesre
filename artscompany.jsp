<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Opportunities - DreamTrail</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }
        .dark-mode {
            background-color: #1e1e1e;
            color: #eee;
        }
        .container {
            max-width: 1100px;
            margin: 100px auto 50px;
            padding: 20px;
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 2.5rem;
        }
        .search-bar {
            text-align: center;
            margin-bottom: 30px;
        }
        .search-bar input {
            padding: 10px 15px;
            width: 300px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 25px;
        }
        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .job-card {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            transition: transform 0.3s ease;
            cursor: pointer;
            aspect-ratio: 1 / 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .job-card:hover {
            transform: translateY(-5px);
        }
        .dark-mode .job-card {
            background-color: #2c2c2c;
            color: #fff;
        }
        .icon-container {
            font-size: 50px;
            color: #007bff;
            margin-bottom: 15px;
            text-align: center;
        }
        .job-card h2 {
            font-size: 1.2rem;
            margin-bottom: 10px;
            text-align: center;
        }
        .job-card ul {
            list-style: none;
            padding-left: 0;
        }
        .job-card li {
            padding: 6px 0;
            color: #555;
            cursor: pointer;
            text-align: center;
        }
        .job-card li:hover {
            text-decoration: underline;
            color: #007bff;
        }
        .dark-toggle {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1000;
            background: #007bff;
            color: white;
            border: none;
            padding: 10px 14px;
            border-radius: 30px;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        #overlay {
            position: fixed;
            top: 0; left: 0;
            width: 100vw;
            height: 100vh;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: 998;
            display: none;
        }
        .popup {
            position: fixed;
            top: 50%; left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
            z-index: 999;
            max-width: 500px;
            width: 90%;
            display: none;
        }
        .popup .close-btn {
            margin-top: 20px;
            text-align: right;
        }
        .popup button {
            padding: 8px 14px;
            border: none;
            background-color: #007bff;
            color: white;
            border-radius: 6px;
            cursor: pointer;
        }
        .dark-mode .popup {
            background-color: #333;
            color: white;
        }
    </style>
</head>
<body>

<button class="dark-toggle" onclick="toggleDarkMode()"><i class="fas fa-moon"></i></button>

<div class="container">
    <h1>Job Opportunities</h1>
    <div class="search-bar">
        <input type="text" id="searchInput" placeholder="Search by job role..." onkeyup="filterJobs()">
    </div>

    <div class="card-container">
        <!-- Example Card -->
        <div class="job-card">
            <div class="icon-container"><i class="fas fa-photo-video"></i></div>
            <h2>Media and Entertainment</h2>
            <ul>
                <li onclick="showRoadmap('times')">Times of India - Journalist</li>
                <li onclick="showRoadmap('ndtv')">NDTV - News Anchor</li>
                <li onclick="showRoadmap('star')">Star Network - Content Creator</li>
            </ul>
        </div>
        
        <div class="job-card" data-aos="fade-up">
            <div class="icon-container"><i class="fas fa-chalkboard-teacher"></i></div>
            <h2>Education Sector</h2>
            <ul>
                <li onclick="showRoadmap('byjus')">Content Developer</li>
                <li onclick="showRoadmap('unacademy')">Teacher</li>
                <li onclick="showRoadmap('niit')">Educational Consultant</li>
            </ul>
        </div>

        <div class="job-card" data-aos="fade-up">
            <div class="icon-container"><i class="fas fa-hands-helping"></i></div>
            <h2>NGOs & Social Orgs</h2>
            <ul>
                <li onclick="showRoadmap('cry')">Social Worker</li>
                <li onclick="showRoadmap('oxfam')">Program Manager</li>
                <li onclick="showRoadmap('amnesty')">Campaign Coordinator</li>
            </ul>
        </div>

        <div class="job-card" data-aos="fade-up">
            <div class="icon-container"><i class="fas fa-paint-brush"></i></div>
            <h2>Art & Design</h2>
            <ul>
                <li onclick="showRoadmap('figma')">UI/UX Designer</li>
                <li onclick="showRoadmap('adobe')">Graphic Designer</li>
                <li onclick="showRoadmap('designhill')">Visual Artist</li>
            </ul>
        </div>

        <div class="job-card" data-aos="fade-up">
            <div class="icon-container"><i class="fas fa-bullhorn"></i></div>
            <h2>PR & Marketing</h2>
            <ul>
                <li onclick="showRoadmap('ogilvy')">Marketing Specialist</li>
                <li onclick="showRoadmap('edelman')">PR Executive</li>
                <li onclick="showRoadmap('wunderman')">Copywriter</li>
            </ul>
        </div>

        <div class="job-card" data-aos="fade-up">
            <div class="icon-container"><i class="fas fa-landmark"></i></div>
            <h2>Govt. & Public Sector</h2>
            <ul>
                <li onclick="showRoadmap('doordarshan')">Content Editor</li>
                <li onclick="showRoadmap('railways')">Admin Roles</li>
                <li onclick="showRoadmap('culture')">Cultural Officer</li>
            </ul>
        </div>

        <div class="job-card" data-aos="fade-up">
            <div class="icon-container"><i class="fas fa-shopping-cart"></i></div>
            <h2>E-Commerce</h2>
            <ul>
                <li onclick="showRoadmap('amazon')">Content Manager</li>
                <li onclick="showRoadmap('flipkart')">Creative Writer</li>
                <li onclick="showRoadmap('myntra')">Fashion Stylist</li>
            </ul>
        </div>
    </div>

</div>

<div id="overlay" onclick="closePopup()"></div>
<div id="popup" class="popup">
    <div id="popup-content"></div>
    <div class="close-btn">
        <button onclick="closePopup()">Close</button>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
<script>
    AOS.init();

    let darkMode = false;

    function toggleDarkMode() {
        darkMode = !darkMode;
        document.body.classList.toggle('dark-mode', darkMode);
    }

    function filterJobs() {
        const search = document.getElementById('searchInput').value.toLowerCase();
        const cards = document.querySelectorAll('.job-card');
        cards.forEach(card => {
            const heading = card.querySelector('h2').textContent.toLowerCase();
            card.style.display = heading.includes(search) ? 'block' : 'none';
        });
    }

    function showRoadmap(key) {
        const roadmapData = {
            times: `<h3>Times of India - Journalist</h3><ul><li>1. Bachelor's in Journalism.</li><li>2. Build portfolio.</li><li>3. Intern at media house.</li><li>4. Learn editing and research.</li><li>5. Apply for positions.</li></ul>`,
            ndtv: `<h3>NDTV - News Anchor</h3><ul><li>1. Degree in Broadcast Journalism.</li><li>2. Voice training.</li><li>3. Internships.</li><li>4. Build anchor reel.</li><li>5. Apply for anchor roles.</li></ul>`,
            star: `<h3>Star Network - Content Creator</h3><ul><li>1. Learn editing & storytelling.</li><li>2. Start a channel.</li><li>3. Learn branding.</li><li>4. Freelance or intern.</li><li>5. Apply to creator roles.</li></ul>`,
            unacademy: `<h3>Unacademy - Teacher</h3><ul><li>1. Expertise in subject area.</li><li>2. Create engaging lessons & materials.</li><li>3. Apply for teaching roles on Unacademy.</li><li>4. Conduct live classes and assessments.</li><li>5. Work with the content team.</li></ul>`,
            niit: `<h3>NIIT - Educational Consultant</h3><ul><li>1. Degree in education or relevant field.</li><li>2. Experience in education technology.</li><li>3. Apply for consultant roles at NIIT.</li><li>4. Consult educational institutions.</li><li>5. Lead educational programs & workshops.</li></ul>`,
            byjus: `<h3>Byju's - Content Developer</h3><ul><li>1. Degree in education or subject-specific field.</li><li>2. Knowledge of digital learning tools.</li><li>3. Create engaging educational content.</li><li>4. Work closely with instructional designers.</li><li>5. Edit and refine content based on feedback.</li></ul>`,
            cry: `<h3>CRY - Social Worker</h3><ul><li>1. Study social work or humanities.</li><li>2. Volunteer experience.</li><li>3. Apply online.</li><li>4. Field training.</li><li>5. Work in community projects.</li></ul>`,
            oxfam: `<h3>Oxfam - Program Manager</h3><ul><li>1. Degree in development studies.</li><li>2. 2-5 years in NGO space.</li><li>3. Apply to Oxfam careers.</li><li>4. Plan/manage social programs.</li><li>5. Progress to leadership roles.</li></ul>`,
            amnesty: `<h3>Amnesty - Campaign Coordinator</h3><ul><li>1. Passion for human rights.</li><li>2. Study public policy or social work.</li><li>3. Join internship/campaign work.</li><li>4. Apply for job role.</li><li>5. Run awareness programs.</li></ul>`,
            figma: `<h3>Figma - UI/UX Designer</h3><ul><li>1. Learn design tools like Figma, XD.</li><li>2. Build strong portfolio.</li><li>3. Apply online with projects.</li><li>4. Clear interviews & join team.</li><li>5. Keep updating skills.</li></ul>`,
            adobe: `<h3>Adobe - Graphic Designer</h3><ul><li>1. Master Adobe tools (Ps, Ai, Id).</li><li>2. Build digital portfolio.</li><li>3. Apply to Adobe jobs.</li><li>4. Demonstrate creativity in interviews.</li><li>5. Work on design campaigns.</li></ul>`,
            designhill: `<h3>Designhill - Visual Artist</h3><ul><li>1. Strong art fundamentals.</li><li>2. Upload portfolio to Designhill.</li><li>3. Participate in contests.</li><li>4. Earn commissions.</li><li>5. Grow as freelance artist.</li></ul>`,
            ogilvy: `<h3>Ogilvy - Marketing Specialist</h3><ul><li>1. Degree in marketing.</li><li>2. Hands-on experience in campaigns.</li><li>3. Apply to Ogilvy careers.</li><li>4. Design creative marketing plans.</li><li>5. Work with global clients.</li></ul>`,
            edelman: `<h3>Edelman - PR Executive</h3><ul><li>1. Degree in public relations.</li><li>2. Intern or freelance PR work.</li><li>3. Apply to Edelman careers.</li><li>4. Write press releases & pitch.</li><li>5. Promote clients’ reputation.</li></ul>`,
            wunderman: `<h3>Wunderman - Copywriter</h3><ul><li>1. Degree in communications/English.</li><li>2. Strong portfolio of writing work.</li><li>3. Apply for copywriting jobs.</li><li>4. Write creative marketing copy.</li><li>5. Build your creative network.</li></ul>`,
            doordarshan: `<h3>Doordarshan - Content Editor</h3><ul><li>1. Degree in media/journalism.</li><li>2. Work on TV editing skills.</li><li>3. Apply for content roles at DD.</li><li>4. Edit TV shows and news.</li><li>5. Progress to senior roles.</li></ul>`,
            railways: `<h3>Indian Railways - Admin Roles</h3><ul><li>1. Graduate in any field.</li><li>2. Clear Railway exams.</li><li>3. Apply to roles through UPSC.</li><li>4. Join Indian Railways.</li><li>5. Advance in railway administration.</li></ul>`,
            culture: `<h3>Culture Ministry - Officer</h3><ul><li>1. Study cultural studies/history.</li><li>2. Apply to government roles.</li><li>3. Assist in heritage projects.</li><li>4. Work on cultural promotion.</li><li>5. Grow in government positions.</li></ul>`,
            amazon: `<h3>Amazon - Content Manager</h3><ul><li>1. Degree in English or marketing.</li><li>2. Build content strategy skills.</li><li>3. Apply for roles at Amazon.</li><li>4. Create & manage content.</li><li>5. Develop new marketing campaigns.</li></ul>`,
            flipkart: `<h3>Flipkart - Creative Writer</h3><ul><li>1. Creative writing background.</li><li>2. Work on product descriptions.</li><li>3. Apply to Flipkart careers.</li><li>4. Write for e-commerce platforms.</li><li>5. Help shape brand identity.</li></ul>`,
            myntra: `<h3>Myntra - Fashion Stylist</h3><ul><li>1. Degree in fashion design/styling.</li><li>2. Work as freelance stylist.</li><li>3. Apply for Myntra stylist jobs.</li><li>4. Work on styling campaigns.</li><li>5. Build portfolio in fashion styling.</li></ul>`
        };
        document.getElementById('popup-content').innerHTML = roadmapData[key];
        document.getElementById('overlay').style.display = 'block';
        document.getElementById('popup').style.display = 'block';
    }

    function closePopup() {
        document.getElementById('overlay').style.display = 'none';
        document.getElementById('popup').style.display = 'none';
    }
</script>

</body>
</html>
